/// id : 1
/// name : "username1"
/// profilePicture : "Profile Picture1"
/// phoneNumber : "Phone Number1"
/// email : "Email1"
/// address : "Address1"
/// zipcode : "Zipcode"
/// password : "Password"
/// isBuyer : true
/// isLoggedIn : false
/// shoppingBag : []

class UserInfo {
  String? id;
  String? name;
  String? profilePicture;
  String? phoneNumber;
  String? email;
  String? address;
  String? zipcode;
  String? password;
  bool? isBuyer;
  bool? isLoggedIn;
  List<dynamic>? shoppingBag;
  List<dynamic>? orderHistory;

  UserInfo(
      this.id,
      this.name,
      this.profilePicture,
      this.phoneNumber,
      this.email,
      this.address,
      this.zipcode,
      this.password,
      this.isBuyer,
      this.isLoggedIn,
      this.shoppingBag,
      this.orderHistory);

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      json['id'],
      json['name'],
      json['profilePicture'],
      json['phoneNumber'],
      json['email'],
      json['address'],
      json['zipcode'],
      json['password'],
      json['isBuyer'],
      json['isLoggedIn'],
      json['shoppingBag'],
      json['orderHistory'],
    );
  }

  static List<UserInfo> fromListJson(List<dynamic> json) {
    List<UserInfo> result = <UserInfo>[];
    for (Map<String, dynamic> d in json) {
      result.add(UserInfo.fromJson(d));
    }
    return result;
  }

  static UserInfo fromSingleUserJson(dynamic json) {
    return UserInfo.fromJson(json);
  }
}
