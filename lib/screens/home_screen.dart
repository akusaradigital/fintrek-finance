import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/balance_card.dart';
import '../widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    return SafeArea(child: ListView(padding: const EdgeInsets.all(16), children: [const SizedBox(height: 8), const Text('Hi, Ollo!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)), const SizedBox(height: 16), BalanceCard(total: s.totalBalance, income: s.totalIncome, expense: s.totalExpense, hidden: s.hideBalance, onToggle: () => s.setHideBalance(!s.hideBalance)), const SizedBox(height: 16), _quickActions(), const SizedBox(height: 16), _budgetCard(), const SizedBox(height: 16), const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)), ...s.transactions.take(5).map((t) => TransactionItem(tx: t)).toList() ]));
  }
  Widget _quickActions() => Row(children: const [Expanded(child: _Action(label: 'Assistant', icon: Icons.auto_awesome)), SizedBox(width: 10), Expanded(child: _Action(label: 'AI Scan', icon: Icons.document_scanner)), SizedBox(width: 10), Expanded(child: _Action(label: 'Voice', icon: Icons.mic))]);
  Widget _budgetCard() => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF121A2E), borderRadius: BorderRadius.circular(20)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Monthly Budget', style: TextStyle(fontWeight: FontWeight.w700)), SizedBox(height: 8), LinearProgressIndicator(value: 0.6), SizedBox(height: 6), Text('Rp 3.000.000 / Rp 5.000.000') ]));
}
class _Action extends StatelessWidget { const _Action({required this.label, required this.icon}); final String label; final IconData icon; @override Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFF121A2E), borderRadius: BorderRadius.circular(18)), child: Column(children: [Icon(icon), const SizedBox(height: 8), Text(label)])); }
