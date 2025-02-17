class UserModel {
  UserModel({
    required this.received,
    required this.data,
  });
  late final bool received;
  late final UserData data;

  UserModel.fromJson(Map<String, dynamic> json) {
    received = json['received'];
    data = UserData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['received'] = received;
    _data['data'] = data.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.email,
    required this.username,
    required this.iat,
    required this.exp,
    required this.balance,
  });
  late final String email;
  late final String username;
  late final int iat;
  late final int exp;
  late final int balance;

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    iat = json['iat'];
    exp = json['exp'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['username'] = username;
    _data['iat'] = iat;
    _data['exp'] = exp;
    _data['balance'] = balance;
    return _data;
  }
}
