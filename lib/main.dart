import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radar_covid_clone/core/controllers/home_controller.dart';
import 'package:radar_covid_clone/ui/home.dart';

void main() {
  setupControllers();
  runApp(MyApp());
}

setupControllers() {
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "muli",
      ),
      home: HomeScreen(),
    );
  }
}
