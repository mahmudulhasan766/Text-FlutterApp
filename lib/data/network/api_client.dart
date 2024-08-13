import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/app/app_dependency.dart';
import 'package:test_app/core/app/app_preference.dart';
import 'package:test_app/data/network/client_headers.dart';
import 'api_urls.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = "Authorization";

enum Method { get, post, put, delete, patch }

@Injectable()
class ApiClient {
  final AppPreferences _appPreferences;
  final Dio _dio;

  ApiClient(this._dio) : _appPreferences = instance.get() {
    initInterceptors();
  }

  void initInterceptors() {
    _dio.options.baseUrl = ApiUrls.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          log('Status Code: ${err.response?.statusCode} Error Data: ${err.response?.data}');
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
    FormData? formData,
    bool isMultipart = false,
    bool isAuth = false,
    bool otherHeader = false,
  }) async {
    Map<String, dynamic> headers = <String, dynamic>{};
    String token = await _appPreferences.getUserAuthToken();
    _dio.options.headers.addAll(otherHeader
        ? ClientHeader.otherHeader()
        : (isAuth
            ? ClientHeader.headers(token)
            : ClientHeader.defaultHeader()));

    _dio.options.baseUrl = ApiUrls.baseUrl;
    Response response;
    log('[${method.name.toUpperCase()}${isMultipart ? '-MULTIPART' : ''}] Request url ======> ${_dio.options.baseUrl}$url');

    try {
      Options requestOptions = Options(
        method: method.name.toUpperCase(),
        headers: headers,
      );

      if (method == Method.post) {
        if (isMultipart && formData != null) {
          response =
              await _dio.post(url, data: formData, options: requestOptions);
        } else {
          response =
              await _dio.post(url, data: params, options: requestOptions);
        }
      } else if (method == Method.delete) {
        response =
            await _dio.delete(url, data: params, options: requestOptions);
      } else if (method == Method.put) {
        response = await _dio.put(url, data: params, options: requestOptions);
      } else {
        response = await _dio.get(url,
            queryParameters: params, options: requestOptions);
      }
      return response.data;
      log('[$url] [${response.statusCode}] Request response =========> ${response.data}');
    } on DioException catch (error) {
      log('$error');
      rethrow;
    }
  }
}
