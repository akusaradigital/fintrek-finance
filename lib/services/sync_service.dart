import 'package:flutter/foundation.dart';
import '../models/transaction.dart';
import 'api_service.dart';
import 'local_db_service.dart';

class SyncService extends ChangeNotifier {
  SyncService(this.db);
  final LocalDbService db;
  final ApiService api = ApiService();
  Future<void> syncTransaction(TransactionModel tx) async { await db.upsertTransaction(tx); await api.postTransaction(tx.toMap()); }
}
