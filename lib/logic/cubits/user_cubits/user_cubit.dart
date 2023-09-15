import 'package:ecommerce_app/data/models/user/repositories/user_repository.dart';
import 'package:ecommerce_app/data/models/user_model.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_state.dart';
import 'package:ecommerce_app/logic/services/preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()) {
    _initialise();
  }

  void _emitLoggedInState(
      {required userModel, required email, required password}) async {
    await Preferences.saveUserDetails(email, password);
    emit(UserLoggedInState(userModel: userModel));
  }

  void _initialise() async {
    final userDetails = await Preferences.fetchUserData();
    String? email = userDetails["email"];
    String? password = userDetails["password"];

    if (email == null || password == null) {
      emit(UserLoggedOutState());
    } else {
      signIn(email: email, password: password);
    }
  }

  final UserRepository _userRepository = UserRepository();
  //User Signin
  void signIn({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      _emitLoggedInState(
          userModel: userModel, email: email, password: password);
    } catch (error) {
      emit(UserErrorState(errorMessage: error.toString()));
    }
  }

  // User Create
  void createAccount({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.createAccount(email: email, password: password);
      _emitLoggedInState(
          userModel: userModel, email: email, password: password);
    } catch (error) {
      emit(UserErrorState(errorMessage: error.toString()));
    }
  }
}
