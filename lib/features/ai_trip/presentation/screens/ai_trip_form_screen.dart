import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../providers/trip_request_provider.dart';
// import '../../data/mock_trip_repository.dart';
import '../../data/gemini_trip_repository.dart';
import '../../../../core/theme/app_colors.dart';

class AiTripFormScreen extends ConsumerStatefulWidget {
  const AiTripFormScreen({super.key});

  @override
  ConsumerState<AiTripFormScreen> createState() => _AiTripFormScreenState();
}

class _AiTripFormScreenState extends ConsumerState<AiTripFormScreen> {
  final _controller = TextEditingController();

  final List<String> _budgets = ['Budget', 'Medium', 'High', 'Luxury'];
  final List<String> _interests = [
    'Sightseeing',
    'Food',
    'Adventure',
    'Nature',
    'History',
    'Relaxation',
  ];

  bool _isGenerating = false;
  List<String> _availableModels = [];

  @override
  void initState() {
    super.initState();
    // Initialize controller with current state if revisiting
    _controller.text = ref.read(tripRequestProvider).destination;
    _fetchAvailableModels();
  }

  Future<void> _fetchAvailableModels() async {
    final repository = GeminiTripRepository();
    final models = await repository.listAllModels();
    setState(() {
      _availableModels = models;
    });
  }

  Future<void> _generateTrip() async {
    final tripState = ref.read(tripRequestProvider);

    if (tripState.destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a destination!')),
      );
      return;
    }

    setState(() => _isGenerating = true);

    try {
      // Use Gemini Repository for Real AI response
      final repository = GeminiTripRepository();
      final itinerary = await repository.generateTrip(tripState);

      // final repository = MockTripRepository();
      // final itinerary = await repository.generateTrip(tripState);

      if (mounted) {
        context.push('/create-trip/result', extra: itinerary);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDateRange(BuildContext context) async {
    final current = ref.read(tripRequestProvider);
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      initialDateRange: DateTimeRange(
        start: current.startDate,
        end: current.endDate,
      ),
    );

    if (picked != null) {
      ref
          .read(tripRequestProvider.notifier)
          .updateDates(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripState = ref.watch(tripRequestProvider);
    final textTheme = Theme.of(context).textTheme;

    String dateString() {
      return "${DateFormat('MMM dd').format(tripState.startDate)} - ${DateFormat('MMM dd, yyyy').format(tripState.endDate)}";
    }

    int daysCount() {
      return tripState.endDate.difference(tripState.startDate).inDays + 1;
    }

    Widget buildSectionTitle(String title) {
      return Text(
        title,
        style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Your Trip ✈️'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Display available models for debugging
                if (_availableModels.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available AI Models:',
                          style: textTheme.titleSmall?.copyWith(
                            color: Colors.blue.shade800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ..._availableModels.map(
                          (model) => Text(
                            model,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                buildSectionTitle('Where do you want to go?'),
                const SizedBox(height: 8),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'e.g. Paris, Tokyo, New York',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (val) {
                    ref
                        .read(tripRequestProvider.notifier)
                        .updateDestination(val);
                  },
                ),
                const SizedBox(height: 24),

                // 2. Dates
                buildSectionTitle('When is your trip?'),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => _pickDateRange(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.blue),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${daysCount()} days',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 3. Budget
                buildSectionTitle('What is your budget?'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: _budgets.map((budget) {
                    final isSelected = tripState.budget == budget;
                    return ChoiceChip(
                      label: Text(budget),
                      selected: isSelected,
                      selectedColor: AppColors.primary.withOpacity(0.2),
                      onSelected: (selected) {
                        if (selected) {
                          ref
                              .read(tripRequestProvider.notifier)
                              .updateBudget(budget);
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // 4. Interests
                buildSectionTitle('What are you interested in?'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _interests.map((interest) {
                    final isSelected = tripState.interests.contains(interest);
                    return FilterChip(
                      label: Text(interest),
                      selected: isSelected,
                      onSelected: (_) {
                        ref
                            .read(tripRequestProvider.notifier)
                            .toggleInterest(interest);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),

                // Generate Button
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isGenerating ? null : _generateTrip,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.greyLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isGenerating
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Generate Trip 🚀',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
