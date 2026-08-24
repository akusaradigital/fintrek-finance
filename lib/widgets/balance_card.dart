import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.total, required this.income, required this.expense, required this.hidden, required this.onToggle});
  final double total, income, expense; final bool hidden; final VoidCallback onToggle;
  @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1E2745), Color(0xFF151B31)]), borderRadius: BorderRadius.circular(28)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Total Balance', style: TextStyle(color: Colors.white70)), IconButton(onPressed: onToggle, icon: Icon(hidden ? Icons.visibility_off : Icons.visibility, color: Colors.white))]), Text(hidden ? '••••••••' : 'Rp ${total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(height: 16), Row(children: [Expanded(child: _mini('Income', income, Colors.greenAccent)), Expanded(child: _mini('Expense', expense, Colors.redAccent))]) ]));
  Widget _mini(String label, double value, Color color) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.white54)), Text('Rp ${value.toStringAsFixed(0)}', style: TextStyle(color: color, fontWeight: FontWeight.w700))]);
}
