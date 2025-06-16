import 'package:flutter/material.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20cubit.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20state.dart';
import 'package:flutter_application_7/views/search_view.dart';
import 'package:flutter_application_7/widgets/info_weather_body.dart';
import 'package:flutter_application_7/widgets/no_weather_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<Getweathercubit, Weatherstate>(
        builder: (context, state) {
          if (state is Noweatherstate) {
            return NoWeatherBody();
          } 
          else if (state is Weatherloadedstate) {
            return WeatherInfoBody(weather: state.weatherModel, );
            
          } else {
            return Text("there error");
          }
        },
      ),
    );
  }
}
