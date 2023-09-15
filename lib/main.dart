// ignore_for_file: prefer_const_constructors
import 'dart:developer';
import 'package:ecommerce_app/core/ui.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_cubit.dart';
import 'package:ecommerce_app/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routes.dart';

void main(List<String> args) {
  Bloc.observer = EccomerceBloc();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.defaultTheme,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}

class EccomerceBloc extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc : $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc : $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed on $bloc");
    super.onClose(bloc);
  }
}
