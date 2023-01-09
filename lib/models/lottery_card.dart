import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LotteryCard {
  String id;
  String lotteryName;
  Map images;
  Map descriptions;
  Map rules;
  int numberCount;
  double price;
  double jackPot;
  int isMain;
  LotteryCard({
    required this.id,
    required this.lotteryName,
    required this.images,
    required this.descriptions,
    required this.rules,
    required this.numberCount,
    required this.price,
    required this.jackPot,
    required this.isMain
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id':id,
      'lotteryName': lotteryName,
      'images': images,
      'descriptions': descriptions,
      'rules':rules,
      'numberCount': numberCount,
      'price': price,
      'jackPot': jackPot,
      'isMain':isMain
    };
  }

  factory LotteryCard.fromMap(Map<String, dynamic> map) {
    return LotteryCard(
      id: map['_id'] as String,
      lotteryName: map['lotteryName'] as String,
      images: Map.from(map['images'] as Map),
      descriptions: map['descriptions'] as Map,
      rules: map['rules'] as Map,
      numberCount: map['numberCount'] as int,
      price: map['price'] + .0 as double,
      jackPot: double.parse(map['jackPot'].toString()),
      isMain: map['isMain'] as int
    );
  }

  String toJson() => json.encode(toMap());

  factory LotteryCard.fromJson(String source) => LotteryCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
