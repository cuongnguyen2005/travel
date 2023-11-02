import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAccount {
  String uid;
  String name;
  String userName;
  String password;
  DateTime createAt;
  DateTime modifieAt;
  UserAccount({
    required this.uid,
    required this.name,
    required this.userName,
    required this.password,
    required this.createAt,
    required this.modifieAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'userName': userName,
      'password': password,
      'createAt': createAt.toIso8601String(),
      'modifieAt': modifieAt.toIso8601String(),
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      uid: map['uid'] as String,
      name: map['name'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
      createAt: DateTime.parse(map['createAt']),
      modifieAt: DateTime.parse(map['modifieAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAccount(userName: $userName, password: $password)';
  }
}
