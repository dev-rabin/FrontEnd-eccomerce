// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Eccomerce App"),
      ),
      body: ListView(padding: EdgeInsets.all(12), children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizeBox(),
        PrimaryTextField(
          controller: emailController,
          hintText: "Email",
          labelText: "Email",
        ),
        SizeBox(),
        PrimaryTextField(
          controller: passwordController,
          hintText: "Password",
          labelText: "Password",
          obsecureText: true,
        ),
        SizeBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LinkButton(text: "Forgot Password?"),
          ],
        ),
        SizeBox(),
        PrimaryButton(text: "Login"),
        SizeBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            LinkButton(
              text: "Signup",
              onpressed: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
            )
          ],
        )
      ]),
    );
  }
}
