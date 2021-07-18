import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_bloc.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/services/product_service.dart';

class PrepurchasedListingArguments {
  final int productID;
  PrepurchasedListingArguments({this.productID});
}

class PrepurchasedProduct extends StatefulWidget {
  @override
  _PrepurchasedProductState createState() => _PrepurchasedProductState();
}

class _PrepurchasedProductState extends State<PrepurchasedProduct> {
  @override
  initState() {
    super.initState();
    ProductService productService = new ProductService();
    var products = productService.getProductsDetails(productId: 1);
    print(products);
    //BlocProvider.of<ProductsBloc>(context).add(ProductRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final PrepurchasedListingArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    height: 900,
                    child: BlocProvider(
                        create: (context) => ProductsBloc()
                          ..add(
                              ProductDaetailsEvent(productID: args.productID)),
                        child: BlocBuilder<ProductsBloc, ProductsState>(
                          builder: (BuildContext context, ProductsState state) {
                            if (state is ShowProductsLoadSuccess) {
                              return CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black));
                            } 
                            
                            else {
                              return Text(
                                "Loading .......",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              );
                            }
                            
                          },
                          listener: (BuildContext context, state) {
                            if (state is ShowProductsLoadSuccess) {
                              return Column(
                                children: [Text('state.products.name,')],
                              );
                            }
                          },
                        )

                        /* BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (BuildContext context, state) {
                          if (state is ShowProductsLoadSuccess) {
                            return Column(
                              children: [
                                Text(
                                  state.products.name,
                                )
                              ],
                            );
                          } else {
                            return Center(
                              child: Text("Product is Empty"),
                            );
                          }
                        },
                      ), */
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
