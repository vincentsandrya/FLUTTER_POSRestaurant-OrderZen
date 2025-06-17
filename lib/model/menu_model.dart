class MenuModel {
  final int menuId;
  final String name;
  final String description;
  final int price;
  final String categoryName;

  MenuModel(
    this.menuId,
    this.name,
    this.description,
    this.price,
    this.categoryName,
  );

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      json['menu_id'],
      json['name'],
      json['description'],
      json['price'],
      json['category_name'],
    );
  }
}
