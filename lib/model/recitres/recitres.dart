import 'reciter.dart';

class ReciterResponse {
  List<Reciter>? reciters;

  ReciterResponse({this.reciters});

  factory ReciterResponse.fromJson(Map<String, dynamic> json) =>
      ReciterResponse(
        reciters: (json['reciters'] as List<dynamic>?)
            ?.map((e) => Reciter.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
