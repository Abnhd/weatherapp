import 'package:dio/dio.dart';
import 'package:flutter_application_7/models/weather_model.dart';

class Weatherservices {
  Weatherservices(this.dio);
  final String baseurl = 'http://api.weatherapi.com/v1';
  final String apikey = '289433bcfad647ba927172607251605';
  final Dio dio;
  Future<WeatherModel?> getcurrentweather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseurl/forecast.json?key=$apikey&q=$cityname&days=1');
          if(response.statusCode == 200){
WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
          }
      
    } on DioException catch (e) {
      final String error=e.response?.data['error']['message']??"oops error";
      return null;
    }
    catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  
  }
}
