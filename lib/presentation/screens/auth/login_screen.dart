// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_app/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
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
        (provider.error != "")
            ? Text(
                provider.error,
                style: TextStyle(color: Colors.red),
              )
            : SizedBox(),
        SizeBox(),
        PrimaryTextField(
          controller: provider.emailController,
          hintText: "Email",
          labelText: "Email",
        ),
        SizeBox(),
        PrimaryTextField(
          controller: provider.passwordController,
          obsecureText: true,
          hintText: "Password",
          labelText: "Password",
        ),
        SizeBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LinkButton(text: "Forgot Password?"),
          ],
        ),
        SizeBox(),
        PrimaryButton(
          text: (provider.isLoading) ? "..." : "Login",
          onpressed: () {
            provider.login();
          },
        ),
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
