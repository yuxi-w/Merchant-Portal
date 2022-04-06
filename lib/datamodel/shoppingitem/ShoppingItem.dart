class ShoppingItem {
  String? id;
  String? name;
  String? shortDescription;
  String? description;
  String? picture;
  String? price;
  String? option;
  String? category;
  String? quantity;

  ShoppingItem(this.id, this.name, this.shortDescription, this.description,
      this.picture, this.price, this.option, this.category, this.quantity);

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      json['id'],
      json['name'],
      json['shortDescription'],
      json['description'],
      json['picture'],
      json['price'],
      json['option'],
      json['category'],
      json['quantity'],
    );
  }

  static List<ShoppingItem> fromListJson(List<dynamic> json) {
    List<ShoppingItem> result = <ShoppingItem>[];
    for (Map<String, dynamic> d in json) {
      result.add(ShoppingItem.fromJson(d));
    }
    return result;
  }
}
