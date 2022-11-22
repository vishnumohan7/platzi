import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platzi/src/cubit/products_repository.dart';
import 'package:platzi/src/models/ProductsModel.dart';
import 'package:platzi/src/models/api_response_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  ProductsRepository _repository = ProductsRepository();

  getAllProducts() async {
    emit(ProductsLoading());
    try {
      ApiResponseModel response = await _repository.getAllProducts();
      if (response.data != null) {
        List<dynamic> productList = response.data;
        List<ProductsModel> products = productList
            .map<ProductsModel>((e) => ProductsModel.fromJson(e))
            .toList();
        emit(ProductsLoadSuccess(products));
      } else {
        emit(ProductsLoadError());
      }
    } catch (ex) {
      emit(ProductsLoadError());
    }
  }
}
