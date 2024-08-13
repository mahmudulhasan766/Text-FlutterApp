part of 'product_cubit.dart';

enum ProductStatus {
  empty,
  filled,
  initial,
  loading,
  success,
  failure,
  notFound
}

@immutable
class ProductState extends Equatable {
  final ProductStatus status;
  final List<ProductResponse> productList;
  final List<ProductResponse> searchProductList;

  const ProductState({
    this.status = ProductStatus.initial,
    this.productList = const <ProductResponse>[],
    this.searchProductList = const <ProductResponse>[],
  });

  ProductState copyWith({
    final ProductStatus? status = ProductStatus.initial,
    final List<ProductResponse>? productList,
    final List<ProductResponse>? searchProductList,
  }) {
    return ProductState(
      status: status ?? this.status,
      productList: productList ?? this.productList,
      searchProductList: searchProductList ?? this.searchProductList,
    );
  }

  @override
  List<Object?> get props => [status, productList,searchProductList];
}
