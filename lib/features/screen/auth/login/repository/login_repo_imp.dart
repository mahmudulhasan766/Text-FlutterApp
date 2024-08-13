import 'package:dartz/dartz.dart';
import 'package:test_app/data/network/api_failure.dart';
import 'package:test_app/features/screen/auth/login/model/login_response.dart';
import 'package:test_app/features/screen/auth/login/model/logout_responce.dart';

abstract class LoginRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, LogoutResponse>> logoutUser(
      Map<String, dynamic> params);
}
