import 'package:flutter/material.dart';
import 'package:platzi/src/app.dart';
import 'package:platzi/src/helpers/api_helper.dart';

void main() {
  ApiHelper.initialize();
  runApp(const MyApp());
}
