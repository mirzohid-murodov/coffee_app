import 'package:coffee_mobile/src/core/utils/either/either.dart';
import 'package:coffee_mobile/src/core/utils/failure/failure.dart';
import 'package:coffee_mobile/src/features/dashboard/detail/data/model/product_model.dart';

abstract class DetailDataSource {

  Future<Either<Failure, List<ProductModel>>> getProducts();
}