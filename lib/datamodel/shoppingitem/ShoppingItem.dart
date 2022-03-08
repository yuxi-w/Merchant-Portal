/// id : "1"
/// name : "Item 1 name"
/// shortDescription : "Short description"
/// description : "Long description"
/// picture : "Picture"
/// price : "Price"
/// option : "Black"
/// quantity : "1"

class ShoppingItem {
  ShoppingItem({
    String? id,
    String? name,
    String? shortDescription,
    String? description,
    String? picture,
    String? price,
    String? option,
    String? quantity,}) {
    _id = id;
    _name = name;
    _shortDescription = shortDescription;
    _description = description;
    _picture = picture;
    _price = price;
    _option = option;
    _quantity = quantity;
  }

  ShoppingItem.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _shortDescription = json['shortDescription'];
    _description = json['description'];
    _picture = json['picture'];
    _price = json['price'];
    _option = json['option'];
    _quantity = json['quantity'];
  }

  String? _id;
  String? _name;
  String? _shortDescription;
  String? _description;
  String? _picture;
  String? _price;
  String? _option;
  String? _quantity;

  String? get id => _id;

  String? get name => _name;

  String? get shortDescription => _shortDescription;

  String? get description => _description;

  String? get picture => _picture;

  String? get price => _price;

  String? get option => _option;

  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['shortDescription'] = _shortDescription;
    map['description'] = _description;
    map['picture'] = _picture;
    map['price'] = _price;
    map['option'] = _option;
    map['quantity'] = _quantity;
    return map;
  }

}