import 'dart:convert';
import 'package:flutter/services.dart';

class AzkarModel {
  AzkarModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      category: json["category"] ?? "",
      count: json["count"] ?? "",
      description: json["description"] ?? "",
      reference: json["reference"] ?? "",
      content: json["content"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "category": category,
        "count": count,
        "description": description,
        "reference": reference,
        "content": content,
      };
  static Future<List<AzkarModel>> loadAzkar(String azkarType) async {
    final myAzkar = await rootBundle.loadString('assets/azkar/azkar.json');
    final myAzkarDecoded = jsonDecode(myAzkar);
    if (myAzkarDecoded[azkarType] is List) {
      List<AzkarModel> azkarList = (myAzkarDecoded[azkarType] as List)
          .map((x) => AzkarModel.fromJson(x as Map<String, dynamic>))
          .toList();
      return azkarList;
    } else {
      throw Exception("Invalid Azkar Type");
    }
  }
}
