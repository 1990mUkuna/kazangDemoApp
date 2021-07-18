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
      appBar: AppBar(
        backgroundColor: Color(0xFFE0F1DC),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, size: 32.0),
                ),
              ],
            ),
          ],
        ),
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
      ),
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
                        ..add(ProductDaetailsEvent(productID: args.productID)),
                      child: BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (BuildContext context, state) {
                          if (state is ProductsLoadSuccess) {
                            return GridView.count(
                              primary: true,
                              //physics: BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(1.0),
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 5.0,
                              physics: const ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children:
                                  List.generate(state.products.length, (index) {
                                return Text(
                                  state.products[index].name,
                                );
                              }),
                            );
                          } else {
                            return Center(
                              child: Text("Product is Empty"),
                            );
                          }
                        },
                      ),
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
