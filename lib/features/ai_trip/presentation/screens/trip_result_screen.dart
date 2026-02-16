import 'package:flutter/material.dart';
import '../../models/trip_itinerary_model.dart';
import '../widgets/activity_card.dart';

class TripResultScreen extends StatelessWidget {
  final TripItineraryModel itinerary;

  const TripResultScreen({super.key, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          // 1. Sliver AppBar with Destination Image (Placeholder)
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                itinerary.destination,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://source.unsplash.com/800x600/?travel,${itinerary.destination}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.blueGrey,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Summary Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _SummaryChip(
                    icon: Icons.calendar_today,
                    label: '${itinerary.durationDays} Days',
                  ),
                  _SummaryChip(
                    icon: Icons.attach_money,
                    label: itinerary.budget,
                  ),
                  _SummaryChip(
                    icon: Icons.map,
                    label: '${itinerary.days.length} Stops',
                  ),
                ],
              ),
            ),
          ),

          // 3. Days List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, dayIndex) {
              final day = itinerary.days[dayIndex];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        day.dayTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                    ...day.activities.asMap().entries.map((entry) {
                      final index = entry.key;
                      final activity = entry.value;
                      final isLast = index == day.activities.length - 1;
                      return ActivityCard(activity: activity, isLast: isLast);
                    }),
                  ],
                ),
              );
            }, childCount: itinerary.days.length),
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SummaryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
