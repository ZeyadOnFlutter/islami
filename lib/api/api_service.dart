import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:islami/constants/api_constants.dart';
import 'package:islami/model/prayer_time_response.dart';
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
    } on HttpException catch (e) {
      throw Exception(e.message);
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
        return ReciterResponse.fromJson(json);
      } else {
        throw "An Error Has Happened";
      }
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<PrayerTimeResponse> getPrayerTimes() async {
    try {
      String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
      //or
      // String formattedDate = "${date.year}-${date.month}-${date.day}";
      http.Response response = await http.get(
        Uri.parse("https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt"),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return PrayerTimeResponse.fromJson(json);
      } else {
        throw "An Error Has Happened";
      }
    } on HttpException catch (e) {
      throw Exception(e.message);
    }
  }
}
