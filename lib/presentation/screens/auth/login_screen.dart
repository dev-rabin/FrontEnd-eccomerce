// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
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
        PrimaryTextField(
          controller: emailController,
          hintText: "Email",
          labelText: "Email",
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          controller: passwordController,
          hintText: "Password",
          labelText: "Password",
          obsecureText: true,
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryButton(text: "Login"),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            LinkButton(
              text: "Signup",
              onpressed: () {},
            )
          ],
        )
      ]),
    );
  }
}
