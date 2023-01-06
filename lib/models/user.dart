// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lottery/models/lottery_card.dart';

class User {
  String id;
  String userName;
  String email;
  String password;
  List<LotteryCard> cart;
  User({required this.id ,required this.userName,required this.email,required this.password ,required this.cart });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id':id,
      'userName': userName,
      'email': email,
      'password': password,
      'cart': cart.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    map = map['user'];
    return User(
      id: map['_id'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      cart: List<LotteryCard>.from((map['cart'] as List<dynamic>).map<LotteryCard>((x) => LotteryCard.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
