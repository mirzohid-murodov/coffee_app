import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/datasource/detail_data_source.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/domain/repository/detail_repository.dart';

class DetailRepoImpl extends DetailRepository {
  DetailDataSource detailDataSource;

  DetailRepoImpl(this.detailDataSource);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final result = await detailDataSource.getProducts();

      if (result.isRight) {
        return Right(result.right);
      } else {
        return Left(Failure(message: result.left.message.toString()));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
