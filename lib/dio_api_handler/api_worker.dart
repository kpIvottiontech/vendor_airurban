import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:vendor_airurban/model/request/login_request/login_request.dart';
import 'package:vendor_airurban/model/request/signup_request/signup_request.dart';
import 'package:vendor_airurban/model/response/get_category_response/get_category_response.dart';
import 'package:vendor_airurban/model/response/login_response/login_response.dart';
import 'package:vendor_airurban/model/response/signup_response/signup_response.dart';
import 'api_constants.dart';
import 'dio_client.dart';

class ApiWorker with ApiConstants {
  late DioClient dio;

  ApiWorker() {
    dio = DioClient();
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    var url = Uri.parse(ApiConstants.login);
    print(' >Url>>> $url');
    final response = await dio
        .postbycustom(
        url.toString(),
        data: loginRequest,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
            }
        )
    ).onError((DioException error, stackTrace) {
      log(error.toString());
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    return LoginResponse.fromJson(response.data);
  }

  Future<SignupResponse> signUp(SignupRequest signupRequest) async {
    var url = Uri.parse(ApiConstants.signUp);
    print(' >Url>>> $url');
    final response = await dio
        .postbycustom(
        url.toString(),
        data: signupRequest,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
            }
        )
    ).onError((DioException error, stackTrace) {
      log(error.toString());
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    return SignupResponse.fromJson(response.data);
  }

  Future<GetCategoryResponse> getCategory() async {
    var url = Uri.parse(ApiConstants.getCategory);
    print(' >Url>>> $url');

    final response = await dio
        .getbycustom(
        url.toString()
    ).onError((DioException error, stackTrace) {
      log(error.toString());
      return Future.error(throw DioExceptionHandler.fromDioError(error));
    });
    return GetCategoryResponse.fromJson(response.data);
  }

}
