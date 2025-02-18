import 'dart:convert';

import 'package:islami/constants/api_constants.dart';
import 'package:islami/model/radio/radio_response.dart';
import 'package:http/http.dart' as http;
import 'package:islami/model/recitres/recitres.dart';

class ApiService {
  Future<RadioResponse?> getRadios() async {
    try {
      Uri uri = Uri.https(ApiConstants.baseUrl, ApiConstants.radioEndPoint);
      http.Response response = await http.get(
        uri,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);

        return RadioResponse.fromJson(json);
      } else {
        throw "An Error Has Happened";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ReciterResponse?> getReciters() async {
    try {
      Uri uri = Uri.https(ApiConstants.baseUrl, ApiConstants.recitersEndPoint);
      http.Response response = await http.get(
        uri,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);
        print(response.body);
        return ReciterResponse.fromJson(json);
      } else {
        print(response.body);
        throw "An Error Has Happened";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
