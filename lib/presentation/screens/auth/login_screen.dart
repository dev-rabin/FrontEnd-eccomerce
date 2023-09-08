// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/logic/cubits/user_cubits/user_cubit.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_state.dart';
import 'package:ecommerce_app/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_app/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_app/presentation/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Eccomerce App"),
        ),
        body: Form(
          key: provider.formKey,
          child: ListView(padding: EdgeInsets.all(12), children: [
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required!";
                }

                if (!EmailValidator.validate(value.trim())) {
                  return "Invalid email addresss!";
                }
                return null;
              },
              hintText: "Email",
              labelText: "Email",
            ),
            SizeBox(),
            PrimaryTextField(
              controller: provider.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required!";
                }
                return null;
              },
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
        ),
      ),
    );
  }
}
