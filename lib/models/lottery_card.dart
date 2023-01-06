import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LotteryCard {
  String id;
  String lotteryName;
  Map images;
  String description;
  int numberCount;
  double price;
  double jackPot;
  LotteryCard({
    required this.id,
    required this.lotteryName,
    required this.images,
    required this.description,
    required this.numberCount,
    required this.price,
    required this.jackPot,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id':id,
      'lotteryName': lotteryName,
      'images': images,
      'description': description,
      'numberCount': numberCount,
      'price': price,
      'jackPot': jackPot,
    };
  }

  factory LotteryCard.fromMap(Map<String, dynamic> map) {
    return LotteryCard(
      id: map['_id'] as String,
      lotteryName: map['lotteryName'] as String,
      images: Map.from(map['images'] as Map),
      description: map['description'] as String,
      numberCount: map['numberCount'] as int,
      price: map['price'] as double,
      jackPot: map['jackPot'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LotteryCard.fromJson(String source) => LotteryCard.fromMap(json.decode(source) as Map<String, dynamic>);
}
