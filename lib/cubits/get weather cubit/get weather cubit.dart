import 'package:dio/dio.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20state.dart';
import 'package:flutter_application_7/models/weather_model.dart';
import 'package:flutter_application_7/services/weatherservices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Getweathercubit extends Cubit<Weatherstate> {
  Getweathercubit():super(Noweatherstate ());

  
   WeatherModel? weatherModel;
  
  getweather({required String cityname}) async {
    try {
     weatherModel=await Weatherservices(Dio()).getcurrentweather(cityname: cityname);
      emit(Weatherloadedstate(weatherModel!));
    } 
    catch (e) {
      emit(Weatherfailurestate(
        errormessage: e.toString(),
      ));
    }
  }
}
