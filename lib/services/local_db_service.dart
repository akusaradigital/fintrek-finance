import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';
import '../models/wallet.dart';

class LocalDbService {
  static const _walletBox = 'wallets';
  static const _txBox = 'transactions';
  Future<void> init() async { await Hive.initFlutter(); await Hive.openBox(_walletBox); await Hive.openBox(_txBox); }
  Future<List<WalletModel>> getWallets() async => Hive.box(_walletBox).values.map((e) => WalletModel.fromMap(Map<String, dynamic>.from(e))).toList();
  Future<List<TransactionModel>> getTransactions() async => Hive.box(_txBox).values.map((e) => TransactionModel.fromMap(Map<String, dynamic>.from(e))).toList();
  Future<void> upsertWallet(WalletModel wallet) async => Hive.box(_walletBox).put(wallet.id, wallet.toMap());
  Future<void> upsertTransaction(TransactionModel tx) async => Hive.box(_txBox).put(tx.id, tx.toMap());
}
