import 'package:ecommerce_app/data/models/user/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoggedInState extends UserState {
  final UserModel userModel;
  UserLoggedInState({required this.userModel});
}

class UserLoggedOutState extends UserState {}

class UserErrorState extends UserState {
  final String errorMessage;
  UserErrorState({required this.errorMessage});
}
