// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = "signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          "Sign Up",
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
        PrimaryButton(text: "Login"),
        SizeBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            LinkButton(
              text: "Login",
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            )
          ],
        )
      ]),
    );
  }
}
