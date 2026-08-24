enum TransactionType { expense, income, transfer }

class TransactionModel {
  TransactionModel({required this.id, required this.type, required this.amount, required this.walletId, required this.categoryId, required this.dateTime, this.note = '', this.location = '', this.attachmentPath = '', this.synced = false});
  final String id;
  final TransactionType type;
  final double amount;
  final String walletId;
  final String categoryId;
  final DateTime dateTime;
  final String note;
  final String location;
  final String attachmentPath;
  final bool synced;

  Map<String, dynamic> toMap() => {'id': id, 'type': type.name, 'amount': amount, 'walletId': walletId, 'categoryId': categoryId, 'dateTime': dateTime.toIso8601String(), 'note': note, 'location': location, 'attachmentPath': attachmentPath, 'synced': synced ? 1 : 0};
  factory TransactionModel.fromMap(Map<String, dynamic> m) => TransactionModel(id: m['id'], type: TransactionType.values.firstWhere((e) => e.name == m['type']), amount: (m['amount'] as num).toDouble(), walletId: m['walletId'], categoryId: m['categoryId'], dateTime: DateTime.parse(m['dateTime']), note: m['note'] ?? '', location: m['location'] ?? '', attachmentPath: m['attachmentPath'] ?? '', synced: (m['synced'] ?? 0) == 1);
}
