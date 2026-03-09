import 'dart:async';

import 'package:coffee_mobile/src/core/constants/theme/app_theme.dart';
import 'package:coffee_mobile/src/core/router/app_router.dart';
import 'package:coffee_mobile/src/core/router/app_routes.dart';
import 'package:coffee_mobile/src/features/auth/data/datasource/auth_data_source_impl.dart';
import 'package:coffee_mobile/src/features/auth/data/repository/auth_repo_impl.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_otp_use_case.dart';
import 'package:coffee_mobile/src/features/auth/domain/usecase/auth_register_use_case.dart';
import 'package:coffee_mobile/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/datasource/detail_data_source_impl.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/repository/detail_repo_impl.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/domain/usecase/detail_get_product_use_case.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/presentation/cubit/detail_cubit.dart';
import 'package:coffee_mobile/src/features/dashboard/home/presentation/cubit/home_cubit.dart';
import 'package:coffee_mobile/src/features/dashboard/post/presentation/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(
          create: (context) => DetailCubit(
            DetailGetProductUseCase(DetailRepoImpl(DetailDataSourceImpl())),
          ),
        ),
        BlocProvider(create: (context) => PostCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: AppTheme.themeMode,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: GetStorage().read("accessToken") != null
            ? AppRoutes.main
            : AppRoutes.signup,
      ),
    );
  }
}
