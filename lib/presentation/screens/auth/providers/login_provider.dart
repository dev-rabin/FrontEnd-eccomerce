import 'dart:async';
import 'dart:developer';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_cubit.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProvider extends ChangeNotifier {
  final BuildContext context;
  LoginProvider(this.context) {
    _listenUser();
  }
  bool isLoading = false;
  String error = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  StreamSubscription? userSubscription;

  void _listenUser() {
    log("User State is Running...");
    userSubscription =
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

  void login() async {
    if (!formKey.currentState!.validate()) return null;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    BlocProvider.of<UserCubit>(context)
        .signIn(email: email, password: password);
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    super.dispose();
  }
}
