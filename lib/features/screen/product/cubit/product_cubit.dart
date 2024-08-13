import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/core/app/app_dependency.dart';
import 'package:test_app/core/app/app_preference.dart';
import 'package:test_app/core/constants/app_print.dart';
import 'package:test_app/features/screen/components/custom_progress_loader.dart';
import 'package:test_app/features/screen/product/models/product_response.dart';
import 'package:test_app/features/screen/product/repository/product_imp.dart';
part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final AppPreferences _appPreferences;
  final ProductImp _productRepo;

  ProductCubit(this._productRepo)
      : _appPreferences = instance.get(),
        super(const ProductState());

  TextEditingController searchController = TextEditingController();
  Future<void> fetchProducts() async {
    emit(state.copyWith(status: ProductStatus.loading));
    showProgressDialog();
    try {
      final response = await _productRepo.product({});
      response.fold((failure) {
        dismissProgressDialog();
        emit(state.copyWith(status: ProductStatus.failure));
      }, (data) async {
        List<ProductResponse> products = data ?? [];
        emit(state.copyWith(
            status: ProductStatus.success, productList: products));
        dismissProgressDialog();
        // Optionally fetch feature products
      });
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  void searchProducts({String? query}){
    emit(state.copyWith(status: ProductStatus.loading));
    List<ProductResponse> searchProduct = state.productList.where((product) {
      return product.name!.toLowerCase().contains(query!.toLowerCase());
    }).toList();
    emit(state.copyWith(searchProductList: searchProduct,status: ProductStatus.success));
  }
}
