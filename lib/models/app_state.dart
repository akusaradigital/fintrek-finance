import 'package:flutter/material.dart';
import '../services/local_db_service.dart';
import 'transaction.dart';
import 'wallet.dart';
import 'category.dart';

class AppState extends ChangeNotifier {
  AppState(this.db);
  final LocalDbService db;
  List<TransactionModel> transactions = [];
  List<WalletModel> wallets = [];
  List<CategoryModel> categories = defaultCategories;
  bool hideBalance = false;

  Future<void> loadInitialData() async { wallets = await db.getWallets(); transactions = await db.getTransactions(); if (wallets.isEmpty) { wallets = [WalletModel(id: 'w1', name: 'Bank Mandiri', type: 'Bank Account', balance: 4500000), WalletModel(id: 'w2', name: 'OVO', type: 'E-Wallet', balance: 500000), WalletModel(id: 'w3', name: 'Cash', type: 'Cash', balance: 300000)]; for (final w in wallets) await db.upsertWallet(w); } notifyListeners(); }
  void setHideBalance(bool value) { hideBalance = value; notifyListeners(); }
  double get totalBalance => wallets.fold(0, (p, e) => p + e.balance);
  double get totalIncome => transactions.where((t) => t.type == TransactionType.income).fold(0, (p, e) => p + e.amount);
  double get totalExpense => transactions.where((t) => t.type == TransactionType.expense).fold(0, (p, e) => p + e.amount);
}
