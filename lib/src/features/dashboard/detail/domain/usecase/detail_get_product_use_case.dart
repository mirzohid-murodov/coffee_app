import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/core/utils/usecase/use_case.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/domain/repository/detail_repository.dart';

class DetailGetProductUseCase extends UseCase<List<ProductModel>, NoParams> {
  DetailRepository detailRepository;

  DetailGetProductUseCase(this.detailRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(
    NoParams params,
  ) {
    return detailRepository.getProducts();
  }
}
