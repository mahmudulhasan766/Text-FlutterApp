import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/app/app_context.dart';
import 'package:test_app/core/app/app_dependency.dart';
import 'package:test_app/core/app/app_preference.dart';
import 'package:test_app/core/constants/strings.dart';
import 'package:test_app/features/router/routes.dart';
import 'package:test_app/features/screen/auth/login/repository/login_repo_imp.dart';
import 'package:test_app/features/screen/components/custom_progress_loader.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AppPreferences _appPreferences;
  final LoginRepositoryImp _loginRepository;
  TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final FocusNode focusNodePass = FocusNode();

  LoginCubit(this._loginRepository)
      : _appPreferences = instance.get(),
        super(const LoginState());



  Future<void> loggedIn() async {
    showProgressDialog();
    emit(state.copyWith(inputStatus: InputStatus.loading));
    final response = await _loginRepository.loginUser({
      'email': emailController.text.toString(),
      'password': passController.text.toString(),
    });
    response.fold(
      (failure) {
        dismissProgressDialog();
      },
      (data) async {
        emit(state.copyWith(errorStatus: ErrorStatus.initial));
        _appPreferences.setUserAuthToken(data.token);
        _appPreferences.saveUserData(data);
        loginReset();
        GetContext.offAll(Routes.product);
        dismissProgressDialog();
        emit(state.copyWith(inputStatus: InputStatus.success,isTermsAndConditions: false));
      },
    );
  }

  Future<void> logOut() async {
    showProgressDialog();
    emit(state.copyWith(inputStatus: InputStatus.loading));
    final response = await _loginRepository.logoutUser({});
    response.fold(
      (failure) {
        dismissProgressDialog();
      },
      (data) async {
        emit(state.copyWith(errorStatus: ErrorStatus.initial));
        _appPreferences.removeUserData();
        loginReset();
        GetContext.offAll(Routes.login);
        dismissProgressDialog();
      },
    );
  }

  void termsAndConditionsUpdate(bool value) {
    bool termsAndConditions = value;
    emit(state.copyWith(isTermsAndConditions: termsAndConditions));
  }

  void checkEmptyField() {
    emit(state.copyWith(
      inputStatus: emailController.text.isNotEmpty &&
              passController.text.isNotEmpty &&
              (emailValidatorRegExp.hasMatch(emailController.text))
          ? InputStatus.filled
          : InputStatus.empty,
    ));
  }

  void loginReset() {
    emailController.clear();
    passController.clear();
    emit(state.copyWith(
      inputStatus: InputStatus.empty,
      errorStatus: ErrorStatus.initial,
    ));
  }
}
