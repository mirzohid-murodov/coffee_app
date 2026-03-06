import 'dart:async';
import 'package:coffee_mobile/src/core/config/dio_config.dart';
import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/auth/data/datasource/auth_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthDataSourceImpl extends AuthDataSource {

  @override
  Future<Either<Failure, String>> login({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      print('🚀 LOGIN BOSHLANDI: $userInfo');
      final response = await DioConfig.client.post('/login/', data: userInfo);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('✅ LOGIN MUVAFFAQIYATLI: ${response.data}');


        final accessToken = response.data["tokens"]["access"];
        final refreshToken = response.data["tokens"]["refresh"];

        await GetStorage().write("accessToken", accessToken);
        print("accessToken xotiraga yozildi: ${GetStorage().read("accessToken")}");
        await GetStorage().write("refreshToken", refreshToken);
        print("refreshToken xotiraga yozildi: ${GetStorage().read("refreshToken")}");

        return Right(response.data.toString());
      } else {
        print('⚠️ LOGIN STATUS ERROR: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print('❌ DIO XATOLIK (LOGIN): ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('🔥 KUTILMAGAN XATOLIK (LOGIN): $e');
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      print('📝 RO‘YXATDAN O‘TISH BOSHLANDI: $userInfo');
      final response = await DioConfig.client.post('/register/', data: userInfo);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('🎉 RO‘YXATDAN O‘TISH OK: ${response.data}');

        // Agar tokenlarni saqlash kerak bo'lsa, shu yerda bajaring
        return Right(response.data.toString());
      } else {
        print('⚠️ REGISTER STATUS ERROR: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print('❌ DIO XATOLIK (REGISTER): ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('🔥 KUTILMAGAN XATOLIK (REGISTER): $e');
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> otp({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      print('🔢 OTP TEKSHIRILMOQDA: $userInfo');
      final response = await DioConfig.client.post('/otp-verify/', data: userInfo);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('📥 OTP TASDIQLANDI: ${response.data}');

        final accessToken = response.data["tokens"]["access"];
        final refreshToken = response.data["tokens"]["refresh"];

        await GetStorage().write("accessToken", accessToken);
        print("accessToken xotiraga yozildi: ${GetStorage().read("accessToken")}");
        await GetStorage().write("refreshToken", refreshToken);
        print("refreshToken xotiraga yozildi: ${GetStorage().read("refreshToken")}");
        
        return Right(response.data.toString());
      } else {
        print('⚠️ OTP STATUS ERROR: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print('❌ DIO XATOLIK (OTP): ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('🔥 KUTILMAGAN XATOLIK (OTP): $e');
      rethrow;
    }
  }
}
