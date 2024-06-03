import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/pages/home_page.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Jokes App',
    home: HomePage(),
  ));
}
