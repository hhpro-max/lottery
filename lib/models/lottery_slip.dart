import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class LotterySlip {
    String lotteryId;
    String userId;
    List<List<int>> numbers;
  LotterySlip({
    required this.lotteryId,
    required this.userId,
    required this.numbers,
  });
  



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lotteryId': lotteryId,
      'userId': userId,
      'numbers': numbers,
    };
  }

  factory LotterySlip.fromMap(Map<String, dynamic> map) {
    return LotterySlip(
      lotteryId: map['lotteryId'] as String,
      userId: map['userId'] as String,
      numbers: List<List<int>>.from((map['numbers'] as List<int>).map<List<int>>((x) => x as List<int>,),),
    );
  }

  String toJson() => json.encode(toMap());

  factory LotterySlip.fromJson(String source) => LotterySlip.fromMap(json.decode(source) as Map<String, dynamic>);
}
