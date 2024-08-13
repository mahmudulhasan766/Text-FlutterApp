part of 'cart_cubit.dart';

enum CartStatus {
  empty,
  filled,
  initial,
  loading,
  success,
  failure,
  notFound,
}

@immutable
class CartState extends Equatable{

  final CartStatus status;
  final List<ProductResponse> cartProductList;

  const CartState({
    this.status = CartStatus.initial,
    this.cartProductList = const <ProductResponse>[],
  });

  CartState copyWith({
    final CartStatus? status = CartStatus.initial,
    final List<ProductResponse>? cartProductList,
  }) {
    return CartState(
      status: status ?? this.status,
      cartProductList: cartProductList ?? this.cartProductList,);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,cartProductList];

}

