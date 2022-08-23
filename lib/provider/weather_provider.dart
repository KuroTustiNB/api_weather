import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import '../screens/weather_screen.dart';

class WeatherProvider extends ChangeNotifier {
  final String _key = "a1fc9e6c652b4edfaab143006222507";
  final String _baseURL = "api.weatherapi.com";
  final String _q = "Durango";
  final String _days = "5";

  String todayWeather = '';
  String todayTemp = '';
  String todayDay = '';
  String todayText = '';

  List<dynamic> dataclima = [];

  WeatherProvider() {
    //print("WeatherProvider init");
     getOnDisplayWeather();
  }

  getOnDisplayWeather() async {
    var url = Uri.https(_baseURL, 'v1/forecast.json', {
      "key": _key,
      "q": _q,
      "days": _days,
    });
    //final response = await http.get(url);

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      dataclima = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    final Map<String, dynamic> apiDecoded = json.decode(response.body);

    final image1 = apiDecoded["current"]["condition"]["icon"];
    final todayImageLink = "http:" + image1;
    final currentC = apiDecoded["current"]["temp_c"];
    final day = apiDecoded["current"]["last_updated"];
    final text = apiDecoded["current"]["condition"]["text"];

    todayWeather = todayImageLink;
    todayTemp = currentC.toString();
    todayDay = day;
    todayText = text;

    print(todayTemp);
    print(todayDay);
    print(todayText);
    notifyListeners();
  }
}
