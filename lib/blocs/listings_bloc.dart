import 'dart:developer';

import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/repositories/product_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  final ProductRepository productRepository;

  ProductsBloc({@required this.productRepository})
      : assert(productRepository != null),
        super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(ProductEvent event) async* {
    if (event is ProductRequested) {
      yield ProductsLoadInProgress();
      try {
        final List<Product> products = await productRepository.getProducts();
        yield ProductsLoadSuccess(products: products);
      } catch (e) {
        print(e);
        yield ProductsLoadFailure();
      }
    }
  }
}
