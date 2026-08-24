import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final wallets = context.watch<AppState>().wallets;
    return SafeArea(child: ListView(padding: const EdgeInsets.all(16), children: [const Text('Wallets', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800)), const SizedBox(height: 16), ...wallets.map((w) => Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF121A2E), borderRadius: BorderRadius.circular(20)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(w.name, style: const TextStyle(fontWeight: FontWeight.w700)), Text(w.type)]), Text('Rp ${w.balance.toStringAsFixed(0)}')]))), FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add Wallet')) ]));
  }
}
