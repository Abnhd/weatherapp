import 'package:flutter/material.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20cubit.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20state.dart';
import 'package:flutter_application_7/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: Builder(
          builder: (context) => BlocBuilder<Getweathercubit, Weatherstate>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: teamcolor(
                          BlocProvider.of<Getweathercubit>(context)
                              .weatherModel
                              ?.weathercondition),
                    ),
                    home: HomeView(),
                  );
                },
              )),
    );
  }
}


MaterialColor teamcolor(String? condition) {
  if (condition == null) {
    return Colors.red;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Patchy light drizzle":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;
    case "Patchy snow possible":
    case "Blowing snow":
    case "Blizzard":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.lightBlue;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.indigo;
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    default:
      return Colors.blue; // لون افتراضي للحالات غير المعروفة
  }
}
