import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/data/network/api_client.dart';
import 'package:test_app/data/network/api_exception.dart';
import 'package:test_app/data/network/api_failure.dart';
import 'package:test_app/data/network/api_urls.dart';
import 'package:test_app/features/screen/auth/login/model/login_response.dart';
import 'package:test_app/features/screen/auth/login/model/logout_responce.dart';
import 'login_repo_imp.dart';

@Injectable(as: LoginRepositoryImp)
class LoginRepository implements LoginRepositoryImp {
  final ApiClient apiClient;

  LoginRepository({required this.apiClient});

  @override
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
        url: ApiUrls.login,
        method: Method.post,
        params: params,
      );
      return Right(LoginResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, LogoutResponse>> logoutUser(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
        url: ApiUrls.logout,
        method: Method.post,
        params: params,
        isAuth: true
      );
      return Right(LogoutResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
