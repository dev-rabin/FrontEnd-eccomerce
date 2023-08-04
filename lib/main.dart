// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/presentation/homeScreen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(EccomerceApp());
}

class EccomerceApp extends StatefulWidget {
  const EccomerceApp({super.key});

  @override
  State<EccomerceApp> createState() => _EccomerceAppState();
}

class _EccomerceAppState extends State<EccomerceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
