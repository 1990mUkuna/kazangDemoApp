import 'dart:developer';

import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/models/product_details_model.dart';
import 'package:kazang_demo/repositories/product_repository.dart';
import 'package:kazang_demo/services/product_service.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  ProductRepository productRepository =
      new ProductRepository(productService: new ProductService());

/*   ProductsBloc({@required this.productRepository})
      : assert(productRepository != null),
        super(ProductsInitial()); */

  ProductsBloc() : super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(ProductEvent event) async* {
    if (event is ProductRequestedEvent) {
      //yield ProductsLoadInProgress();
      try {
        yield ProductsLoadInProgress();
        await Future.delayed(const Duration(seconds: 2));

        final List<ProductModel> products =
            await productRepository.getProducts();
        yield ProductsLoadSuccess(products: products);
      } catch (e) {
        print(e);
        yield ProductsLoadFailure();
      }
    }

    if (event is ProductDaetailsEvent) {
      try {
        yield ProductsLoadInProgress();
        await Future.delayed(const Duration(seconds: 2));
        final List<ProductDetailsModel> products =
            await productRepository.getProductsDetails();
      } catch (e) {
        print(e);
        yield ProductsLoadFailure();
      }
    }
  }
}
