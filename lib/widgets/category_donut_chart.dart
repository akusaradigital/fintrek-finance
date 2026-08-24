import 'package:flutter/material.dart';
class CategoryDonutChart extends StatelessWidget {
  const CategoryDonutChart({super.key});
  @override
  Widget build(BuildContext context) => Container(
        height: 180,
        alignment: Alignment.center,
        decoration: const BoxDecoration(shape: BoxShape.circle, gradient: SweepGradient(colors: [Colors.purpleAccent, Colors.blueAccent, Colors.greenAccent, Colors.orangeAccent, Colors.purpleAccent])),
        child: Container(width: 90, height: 90, decoration: const BoxDecoration(color: Color(0xFF0B1020), shape: BoxShape.circle), child: const Center(child: Text('Spending', style: TextStyle(fontSize: 12)))),
      );
}
