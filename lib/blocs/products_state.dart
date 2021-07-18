import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/models/product_details_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final List<ProductModel> products;

  const ProductsLoadSuccess({@required this.products})
      : assert(products != null);

  @override
  List<Object> get props => [this.products];
}

class ProductsDetailsLoadSuccess extends ProductsState {
  final List<ProductDetailsModel> products;

  const ProductsDetailsLoadSuccess({@required this.products})
      : assert(products != null);

  @override
  List<Object> get props => [this.products];
}

class ProductsLoadFailure extends ProductsState {}
