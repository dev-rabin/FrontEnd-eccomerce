// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth/providers/sign_up_provider.dart';
import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = "signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Eccomerce App"),
      ),
      body: Form(
        key: provider.formKey,
        child: ListView(padding: EdgeInsets.all(12), children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          (provider.error != "")
              ? Text(
                  provider.error,
                  style: TextStyle(color: Colors.red),
                )
              : SizedBox(),
          SizeBox(),
          PrimaryTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required!";
              } else if (!EmailValidator.validate(value.trim())) {
                return "Invalid email address!";
              }
              return null;
            },
            controller: provider.emailController,
            hintText: "Email",
            labelText: "Email",
          ),
          SizeBox(),
          PrimaryTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required!";
              }
              return null;
            },
            controller: provider.passwordController,
            hintText: "Password",
            labelText: "Password",
            obsecureText: true,
          ),
          SizeBox(),
          PrimaryTextField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Confirm your password";
              } else if (value.trim() != provider.passwordController.text) {
                return "Passwords do not match!";
              }
              return null;
            },
            controller: provider.confirmPswrdController,
            hintText: "Confrim Password",
            labelText: "Confirm Password",
            obsecureText: true,
          ),
          SizeBox(),
          SizeBox(),
          PrimaryButton(
            text: (provider.isLoading) ? "..." : "Create Account",
            onpressed: provider.createAccount,
          ),
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
      ),
    );
  }
}
