class WalletModel {
  WalletModel({required this.id, required this.name, required this.type, required this.balance, this.institution = '', this.maskedAccount = '', this.currency = 'IDR', this.active = true});
  final String id;
  final String name;
  final String type;
  final double balance;
  final String institution;
  final String maskedAccount;
  final String currency;
  final bool active;

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'type': type, 'balance': balance, 'institution': institution, 'maskedAccount': maskedAccount, 'currency': currency, 'active': active ? 1 : 0};
  factory WalletModel.fromMap(Map<String, dynamic> m) => WalletModel(id: m['id'], name: m['name'], type: m['type'], balance: (m['balance'] as num).toDouble(), institution: m['institution'] ?? '', maskedAccount: m['maskedAccount'] ?? '', currency: m['currency'] ?? 'IDR', active: (m['active'] ?? 1) == 1);
}
