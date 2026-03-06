import 'package:bloc/bloc.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_otp_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_register_use_case.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRegisterUseCase authRegisterUseCase;
  AuthLoginUseCase authLoginUseCase;
  AuthOtpUseCase authOtpUseCase;

  AuthCubit({
    required this.authOtpUseCase,
    required this.authLoginUseCase,
    required this.authRegisterUseCase,
  }) : super(AuthInitialState());

  Future<void> register({
    required String username,
    required String password,
    required String email,
  }) async {
    emit(AuthLoadingState());
    final result = await authRegisterUseCase.call({
      "username": username,
      "email": email,
      "password": password,
    });

    if (result.isRight) {
      print(result.right);
      print("Successga tushdi");
      emit(AuthSuccessState());
    } else {
      print(result.left.message);
      emit(AuthErrorState(errorMessage: result.left.message));
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final result = await authLoginUseCase.call({
      "username": username,
      "password": password,
    });

    if (result.isRight) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: result.left.message));
    }
  }

  Future<void> otp({required String email, required String code}) async {
    emit(AuthLoadingState());
    final result = await authOtpUseCase.call({"email": email, "code": code});

    if (result.isRight) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: result.left.message));
    }
  }
}
