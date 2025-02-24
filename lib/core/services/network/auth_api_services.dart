import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commercial_app/core/config/auth/auth_state.dart';
import 'package:e_commercial_app/data/models/signin/signin_req.dart';
import 'package:e_commercial_app/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/signup/signup_req.dart';
import '../../../data/models/user.dart';
import '../../../di/service_locator.dart';
import 'api_urls.dart';
import 'dio_client.dart';

abstract class AuthApiServices {
  Future<Either<String,String>> signup(SignupReqParams signupReqParams);
  Future<Either<String , UserEntity>> getUser();
  Future<Either<String , String>> signin(SigninReqParams signinReqParams);
  Future<Either<String,String>> logout();
  Future <Either<String,dynamic>> refreshToken();
}

class AuthApiServicesImpl implements AuthApiServices {
  @override
  Future<Either<String, String>> signup(SignupReqParams signupReqParams) async {
    try {
      var response = await sl<DioClient>().post(
          ApiUrls.signup,
          data: signupReqParams.toMap()
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future <Either<String, String>> signin(
      SigninReqParams signinReqParams) async {
    try {
      var response = await sl<DioClient>().post(
          ApiUrls.login,
          data: signinReqParams.toMap()
      );

      String token = response.data['token'];
      String refreshToken = response.data['refreshToken'];
      // Save token to Shared Preferences
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('refreshToken', refreshToken);

      return Right(token);
    } on DioException catch (e) {
      String errorMessage = e.response?.data['message'] ?? "Đã có lỗi xảy ra!";
      return Left(errorMessage);
    } catch (e) {
      return Left("Lỗi không xác định: $e");
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    try {
      //get token from shared preferences
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      var token = sharedPreferences.getString('token');

      //if token is null or empty, return error
      if (token == null || token.isEmpty) {
        return Left("❌ No token found. Please log in.");
      }

      //get user data from server through api
      var response = await sl<DioClient>().get(
        ApiUrls.profile,
        options: Options(headers: {'Authorization': 'Bearer ${token.trim()}'}),
      );

      //if response is not null and response.data is not null, return user data
      if (response != null && response.data != null) {
        print("📡 Response.data['data']: ${response
            .data['data']}"); // print response data

        //check user data format
        var userData = response.data['data'];
        if (userData == null) {
          return Left("❌ Invalid user data format");
        }

        //convert user data to UserModel
        UserModel userModel = UserModel.fromMap(userData);

        //return user entity
        return Right(userModel.toEntity());
      } else {
        return Left("❌ Invalid user data format");
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? "Unknown error");
    } catch (e) {
      return Left("🔥 Unexpected error: $e");
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      SharedPreferences sharedPreferences = sl<SharedPreferences>();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().get(
        ApiUrls.profile,
        options: Options(headers: {'Authorization': 'Bearer ${token?.trim()}'}),
      );
      sharedPreferences.remove('token');
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString() + 'unknow error');
    }
  }

  @override
  Future<Either<String, dynamic>> refreshToken() async {
    try {
      SharedPreferences sharedPreferences = sl<SharedPreferences>();
      var refreshToken = sharedPreferences.getString('refreshToken');

      var response = await sl<DioClient>().get(
        ApiUrls.refresh,
        options: Options(headers: {'X-Refresh-Token': refreshToken}),
      );

      String token = response.data['token'];
      String newRefreshToken = response.data['refreshToken'];
      sharedPreferences.setString('token', token);
      sharedPreferences.setString('refreshToken', newRefreshToken);
      return Right(response.data);
    }on DioException catch(e){
      return Left(e.response?.data['message']);
    }catch(e){
      return Left(e.toString() + 'unknow error');
    }
  }
}