part of 'detail_cubit.dart';

abstract class DetailState {}

class DetailInitialState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailErrorState extends DetailState {
  final String errorMessage;

  DetailErrorState({required this.errorMessage});
}

class DetailSuccessState extends DetailState {
  final List<ProductModel> products;

  DetailSuccessState({required this.products});
}
