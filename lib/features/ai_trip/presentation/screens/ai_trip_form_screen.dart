import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../providers/trip_request_provider.dart';
import '../../data/mock_trip_repository.dart';
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

  @override
  void initState() {
    super.initState();
    // Initialize controller with current state if revisiting
    _controller.text = ref.read(tripRequestProvider).destination;
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
      // Use Mock Repository to simulate AI response
      final repository = MockTripRepository();
      final itinerary = await repository.generateTrip(tripState);

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
    final theme = Theme.of(context);

    // Format Date Range
    final dateString =
        "${DateFormat('MMM dd').format(tripState.startDate)} - ${DateFormat('MMM dd, yyyy').format(tripState.endDate)}";
    final daysCount =
        tripState.endDate.difference(tripState.startDate).inDays + 1;

    return Scaffold(
      appBar: AppBar(title: const Text('Plan Your Trip ✈️'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Destination
            Text(
              'Where do you want to go?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
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
                ref.read(tripRequestProvider.notifier).updateDestination(val);
              },
            ),
            const SizedBox(height: 24),

            // 2. Dates
            Text(
              'When is your trip?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
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
                          dateString,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$daysCount days',
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
            Text(
              'What is your budget?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
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
            Text(
              'What are you interested in?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
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
    );
  }
}
