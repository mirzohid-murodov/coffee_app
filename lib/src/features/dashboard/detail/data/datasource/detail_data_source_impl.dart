import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/datasource/detail_data_source.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../core/config/dio_config.dart';

class DetailDataSourceImpl extends DetailDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await DioConfig.client.get(
        '/products/',
        options: Options(
          headers: {
            "Authorization": "Bearer ${GetStorage().read("accessToken")}",
          },
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        print('✅ Data keldi: ${response.data}');
        final List<dynamic> rawData = response.data;

        final List<ProductModel> data = rawData.map(
          (e) => ProductModel.fromJson(e),
        ).toList();

        return Right(data);
      } else {
        print('⚠️ Detail STATUS ERROR: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print('❌ DIO XATOLIK (detail): ${e.response?.data ?? e.message}');
      throw Exception(e);
    } on TimeoutException catch (e) {
      throw Exception(e);
    } on SocketException catch (e) {
      print('❌ Socket XATOLIK (detail): ${e.message}');
      throw Exception(e);
    } catch (e, stack) {
      print('🔥 KUTILMAGAN XATOLIK (detail): $e, stack: $stack');
      rethrow;
    }
  }
}
