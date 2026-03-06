import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/auth/data/datasource/auth_data_source.dart';
import 'package:coffee_mobile/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  AuthDataSource authDataSource;

  AuthRepoImpl(this.authDataSource);

  @override
  Future<Either<Failure, String>> login({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      final result = await authDataSource.login(userInfo: userInfo);
      if (result.isRight) {
        return Right(result.right);
      } else {
        return Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      final result = await authDataSource.register(userInfo: userInfo);
      if (result.isRight) {
        return Right(result.right);
      } else {
        return Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> otp({
    required Map<String, dynamic> userInfo,
  }) async {
    try {
      final result = await authDataSource.otp(userInfo: userInfo);
      if (result.isRight) {
        return Right(result.right);
      } else {
        return Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
