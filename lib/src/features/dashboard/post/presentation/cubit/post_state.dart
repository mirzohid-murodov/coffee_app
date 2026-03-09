part of 'post_cubit.dart';

abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {}

class PostSuccessState extends PostState {}
