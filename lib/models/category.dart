class CategoryModel {
  CategoryModel({required this.id, required this.name, required this.icon, required this.color, this.kind = 'expense'});
  final String id;
  final String name;
  final String icon;
  final int color;
  final String kind;
}

const defaultCategories = [
  CategoryModel(id: 'food', name: 'Food & Drink', icon: 'restaurant', color: 0xFFFFB86B),
  CategoryModel(id: 'shopping', name: 'Shopping', icon: 'shopping_bag', color: 0xFF8EC5FF),
  CategoryModel(id: 'transport', name: 'Transport', icon: 'directions_car', color: 0xFF8BFFB5),
  CategoryModel(id: 'bills', name: 'Bills', icon: 'receipt_long', color: 0xFFFF8F8F),
  CategoryModel(id: 'other', name: 'Other', icon: 'more_horiz', color: 0xFFC7B4FF),
];
