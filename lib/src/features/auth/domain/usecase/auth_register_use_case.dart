import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/core/utils/usecase/use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/repository/auth_repository.dart';

class AuthRegisterUseCase extends UseCase<String, Map<String, dynamic>>{
  AuthRepository authRepository;

  AuthRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(Map<String, dynamic> params) {
    return authRepository.register(userInfo: params);
  }
}