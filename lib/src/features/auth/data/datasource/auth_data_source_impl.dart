import 'dart:async';
import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/auth/data/datasource/auth_data_source.dart';
import 'package:dio/dio.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: 'https://api-service.fintechhub.uz',
    ),
  );

  @override
  Future<Either<Failure, String>> login({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      print('🚀 LOGIN BOSHLANDI: $userInfo');
      final response = await client.post('/login/', data: userInfo);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('✅ LOGIN MUVAFFAQIYATLI: ${response.data}');
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
      final response = await client.post('/register/', data: userInfo);

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
      final response = await client.post('/otp-verify/', data: userInfo);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('📥 OTP TASDIQLANDI: ${response.data}');
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
