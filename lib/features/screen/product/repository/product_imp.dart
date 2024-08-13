import 'package:dartz/dartz.dart';
import 'package:test_app/data/network/api_failure.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';

abstract class ProductImp {
  Future<Either<ApiFailure, List<ProductResponse>>> product(
      Map<String, dynamic> params);
}
