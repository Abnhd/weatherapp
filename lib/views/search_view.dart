import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/cubits/get%20weather%20cubit/get%20weather%20cubit.dart';
import 'package:flutter_application_7/models/weather_model.dart';
import 'package:flutter_application_7/services/weatherservices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Search a City'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) async {
                  var getweathercubit =
                      BlocProvider.of<Getweathercubit>(context);
                  getweathercubit.getweather(cityname: value);
                
                  Navigator.pop(context);
                  
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsetsDirectional.symmetric(horizontal: 30),
                  labelText: "search",
                  hintText: 'city',
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.red,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 128, 3, 51))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
