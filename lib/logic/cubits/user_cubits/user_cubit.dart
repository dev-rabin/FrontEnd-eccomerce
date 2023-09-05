import 'package:ecommerce_app/data/models/user/repositories/user_repository.dart';
import 'package:ecommerce_app/data/models/user/user_model.dart';
import 'package:ecommerce_app/logic/cubits/user_cubits/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  final UserRepository _userRepository = UserRepository();
  //User Signin
  void signIn({required String email, required String password}) async {
    try {
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      emit(UserLoggedInState(userModel: userModel));
    } catch (error) {
      emit(UserErrorState(errorMessage: error.toString()));
    }
  }

  // User Create
  void createAccount({required String email, required String password}) async {
    try {
      UserModel userModel =
          await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel: userModel));
    } catch (error) {
      emit(UserErrorState(errorMessage: error.toString()));
    }
  }
}
