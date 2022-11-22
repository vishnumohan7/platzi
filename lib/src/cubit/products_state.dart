part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoadSuccess extends ProductsState {
  final List<ProductsModel> products;

  ProductsLoadSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsLoadError extends ProductsState {
  @override
  List<Object> get props => [];
}
