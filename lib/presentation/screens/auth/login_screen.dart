// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Eccomerce App"),
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Email", labelText: "Email"),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration:
              InputDecoration(hintText: "Password", labelText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        CupertinoButton(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 10),
          onPressed: () {},
          child: Text(
            "Login",
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(onPressed: () {}, child: Text("Signup"))
          ],
        )
      ]),
    );
  }
}
