part of 'login_cubit.dart';

enum InputStatus {
  empty,
  filled,
  initial,
  loading,
  success,
  failure,
  authFail,
  notFound,
}

enum ErrorStatus {
  initial,
  emailError,
  passwordError,
  emailValidationError,
}

class LoginState extends Equatable {
  final InputStatus inputStatus;
  final ErrorStatus errorStatus;
  final bool isTermsAndConditions;
  final bool emailValid;

  const LoginState({
    this.inputStatus = InputStatus.empty,
    this.errorStatus = ErrorStatus.initial,
    this.isTermsAndConditions = false,
    this.emailValid = false,
  });

  LoginState copyWith({
    final InputStatus? inputStatus,
    final ErrorStatus? errorStatus,
    final bool? emailValid,
    final bool? isTermsAndConditions,
  }) {
    return LoginState(
      inputStatus: inputStatus ?? this.inputStatus,
      errorStatus: errorStatus ?? this.errorStatus,
      isTermsAndConditions: isTermsAndConditions ?? this.isTermsAndConditions,
      emailValid: emailValid ?? this.emailValid,
    );
  }

  @override
  List<Object> get props => [inputStatus, errorStatus, isTermsAndConditions, emailValid];
}
