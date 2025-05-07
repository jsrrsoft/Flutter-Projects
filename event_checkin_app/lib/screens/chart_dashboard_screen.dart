import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDashboardScreen extends StatelessWidget {
  const ChartDashboardScreen({super.key});

  Stream<QuerySnapshot> getEventsStream() {
    return FirebaseFirestore.instance.collection('events').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Attendee Dashboard (Chart)")),
      body: StreamBuilder<QuerySnapshot>(
        stream: getEventsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading data"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No events found"));
          }

          final events = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxY(events) + 10,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index < events.length) {
                          return Text(
                            _shorten(events[index]['name']),
                            style: const TextStyle(fontSize: 10),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, _) =>
                          Text(value.toInt().toString()),
                    ),
                  ),
                ),
                barGroups: List.generate(events.length, (index) {
                  final count = events[index]['attendeeCount'];
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: count.toDouble(),
                        width: 22,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getMaxY(List<QueryDocumentSnapshot> docs) {
    final counts = docs.map((e) => e['attendeeCount'] as int);
    return counts.fold<double>(0, (max, e) => e > max ? e.toDouble() : max);
  }

  String _shorten(String text) {
    return text.length > 10 ? '${text.substring(0, 10)}…' : text;
  }
}
