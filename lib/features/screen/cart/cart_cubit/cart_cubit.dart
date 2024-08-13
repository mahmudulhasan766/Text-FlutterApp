import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';
part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
  List<ProductResponse> list=<ProductResponse>[];

  void addProduct(ProductResponse product){
    emit(state.copyWith(status: CartStatus.initial));
    bool isMach = list.any((item) => item.id != product.id);
    if(isMach||list.isEmpty){
      list.add(product);
    }
    emit(state.copyWith(cartProductList: list,status: CartStatus.success));
  }

  double get totalPrice => list.fold(
      0, (total, current) => total + (double.parse(current.price.toString()) * current.quantity));

  void incrementItemById({int? id}) {
    emit(state.copyWith(status: CartStatus.initial));
    int index = list.indexWhere((item) => item.id == id);
    list[index].quantity++;
    emit(state.copyWith(cartProductList: list,status: CartStatus.success));
  }

  void decrementItemById({int? id}) {
    emit(state.copyWith(status: CartStatus.initial));
    int index = list.indexWhere((item) => item.id == id);
    list[index].quantity--;
    emit(state.copyWith(cartProductList: list,status: CartStatus.success));
  }

  void removeItemById({int? id}) {
    emit(state.copyWith(status: CartStatus.initial));
    int index = list.indexWhere((item) => item.id == id);
    list.removeAt(index);
    emit(state.copyWith(cartProductList: list,status: CartStatus.success));
  }

}
