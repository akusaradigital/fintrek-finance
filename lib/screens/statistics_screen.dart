import 'package:flutter/material.dart';
import '../widgets/category_donut_chart.dart';
import '../widgets/heatmap_widget.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(16), children: const [Text('Statistics', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)), SizedBox(height: 16), CategoryDonutChart(), SizedBox(height: 16), Text('Activity Heatmap', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), HeatmapWidget(), SizedBox(height: 16), _MonthlyComparison()]));
}
class _MonthlyComparison extends StatelessWidget { const _MonthlyComparison(); @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF121A2E), borderRadius: BorderRadius.circular(20)), child: const Text('Monthly comparison graph placeholder')); }
