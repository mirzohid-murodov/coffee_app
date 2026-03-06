import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';

abstract class AuthDataSource {
  Future<Either<Failure, String>> register({
    required Map<String, dynamic> userInfo
});

  Future<Either<Failure, String>> login({
    required Map<String, dynamic> userInfo
  });

  Future<Either<Failure, String>> otp({
    required Map<String, dynamic> userInfo
  });
}