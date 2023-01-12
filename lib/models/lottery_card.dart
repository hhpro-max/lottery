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
  int numberRange;
  LotteryCard({
    required this.id,
    required this.lotteryName,
    required this.images,
    required this.descriptions,
    required this.rules,
    required this.numberCount,
    required this.price,
    required this.jackPot,
    required this.isMain,
    required this.numberRange,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lotteryName': lotteryName,
      'images': images,
      'descriptions': descriptions,
      'rules': rules,
      'numberCount': numberCount,
      'price': price,
      'jackPot': jackPot,
      'isMain': isMain,
      'numberRange': numberRange,
    };
  }

  factory LotteryCard.fromMap(Map<String, dynamic> map) {
    return LotteryCard(
      id: map['_id'] as String,
      lotteryName: map['lotteryName'] as String,
      images: Map.from((map['images'] as Map)),
      descriptions: Map.from((map['descriptions'] as Map)),
      rules: Map.from((map['rules'] as Map)),
      numberCount: map['numberCount'] as int,
      price: map['price']+.0 as double,
      jackPot: map['jackPot']+.0 as double,
      isMain: map['isMain'] as int,
      numberRange: map['numberRange'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LotteryCard.fromJson(String source) =>
      LotteryCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
