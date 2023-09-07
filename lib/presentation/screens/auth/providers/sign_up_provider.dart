import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/logic/cubits/user_cubits/user_cubit.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpProvider extends ChangeNotifier {
  final BuildContext context;
  SignUpProvider(this.context) {
    createUserListener();
  }

  bool isLoading = false;
  String error = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPswrdController = TextEditingController();
  StreamSubscription? createUserSubscription;

  void createUserListener() {
    log("Create User State in running!");
    createUserSubscription =
        BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if (userState is UserLoggedInState) {
        isLoading = true;
        error = "";
        notifyListeners();
      } else if (userState is UserErrorState) {
        isLoading = false;
        error = userState.errorMessage;
        notifyListeners();
      } else {
        isLoading = false;
        error = "";
        notifyListeners();
      }
    });
  }

  void createAccount() async {
    if (!formKey.currentState!.validate()) return null;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    BlocProvider.of<UserCubit>(context)
        .createAccount(email: email, password: password);
  }
}
