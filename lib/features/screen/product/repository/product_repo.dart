import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/data/network/api_client.dart';
import 'package:test_app/data/network/api_exception.dart';
import 'package:test_app/data/network/api_failure.dart';
import 'package:test_app/data/network/api_urls.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';
import 'product_imp.dart';

@Injectable(as: ProductImp)
class ProductRepository implements ProductImp {
  final ApiClient apiClient;

  ProductRepository({required this.apiClient});

  @override
  Future<Either<ApiFailure, List<ProductResponse>>> product(
      Map<String, dynamic> params) async {
    try {
      final products = <ProductResponse>[];
      final response = await apiClient.request(
          method: Method.get,
          params: params,
          url: ApiUrls.products,
          isAuth: true
      );
      final data = response;
      for (final el in data) {
        final product = ProductResponse.fromJson(el);
        products.add(product);
      }
      return Right(products);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
