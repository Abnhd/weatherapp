import 'package:flutter_application_7/models/weather_model.dart';

class Weatherstate {}

class Noweatherstate extends Weatherstate {}

class Weatherloadedstate extends Weatherstate {
  final WeatherModel weatherModel;

  Weatherloadedstate( this.weatherModel);
}

class Weatherfailurestate extends Weatherstate {
  final String errormessage;

  Weatherfailurestate({required this.errormessage});
}
