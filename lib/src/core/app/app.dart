import 'package:coffee_mobile/src/core/constants/theme/app_theme.dart';
import 'package:coffee_mobile/src/core/router/app_router.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';
import 'package:coffee_mobile/src/features/auth/data/datasource/auth_data_source_impl.dart';
import 'package:coffee_mobile/src/features/auth/data/repository/auth_repo_impl.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_otp_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_register_use_case.dart';
import 'package:coffee_mobile/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authOtpUseCase: AuthOtpUseCase(AuthRepoImpl(AuthDataSourceImpl())),
            authLoginUseCase: AuthLoginUseCase(
              AuthRepoImpl(AuthDataSourceImpl()),
            ),
            authRegisterUseCase: AuthRegisterUseCase(
              AuthRepoImpl(AuthDataSourceImpl()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: AppTheme.themeMode,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.signup,
      ),
    );
  }
}
