import 'package:islami/model/radio/radio.dart';

class RadioResponse {
  RadioResponse({
    required this.radios,
  });

  final List<Radios> radios;

  factory RadioResponse.fromJson(Map<String, dynamic> json) {
    return RadioResponse(
      radios: (json["radios"] as List).cast<Map<String, dynamic>>().map(
        (radio) {
          return Radios.fromJson(radio);
        },
      ).toList(),
    );
  }
}
