import 'package:bloc/bloc.dart';
import 'package:coffee_mobile/src/core/utils/usecase/use_case.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/domain/usecase/detail_get_product_use_case.dart';
part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailGetProductUseCase detailGetProductUseCase;
  DetailCubit(this.detailGetProductUseCase) : super(DetailInitialState()){
    getProducts();
  }

  Future<void> getProducts() async {
    emit(DetailLoadingState());
    final result = await detailGetProductUseCase.call(NoParams());

    if (result.isRight) {
      emit(DetailSuccessState(products: result.right));
    } else {
      emit(DetailErrorState(errorMessage: result.left.message));
    }
  }
}
