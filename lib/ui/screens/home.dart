import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_bloc.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/repositories/product_repository.dart';
import 'package:kazang_demo/services/product_service.dart';
import 'package:kazang_demo/ui/widget/product_card.dart';
import 'package:kazang_demo/ui/widget/product_component.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    super.initState();
    ProductService productService = new ProductService();
    var products = productService.getProducts();
    print(products);
    //BlocProvider.of<ProductsBloc>(context).add(ProductRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                        create: (context) =>
                            ProductsBloc()..add(ProductRequestedEvent()),
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
                                children: List.generate(state.products.length,
                                    (index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          "/prepurchase-product-details",
                                          /* arguments: PrepurchasedListingArguments(
                                listing: state.listings[i],
                              ), */
                                        );
                                      },
                                      child: ProductCard(
                                        backgroundImage:
                                            state.products[index].logo,
                                        title: state.products[index].name,
                                        listing: state.products[index],
                                        description:
                                            state.products[index].summary,
                                      ));
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
      ),
    );
  }
  /*  Container(
                                                child: Card(
                                                  semanticContainer: true,
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Image.network(
                                                    state.products[index].logo,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 5,
                                                  margin: EdgeInsets.all(10),
                                                ),
                                                decoration: new BoxDecoration(
                                                  boxShadow: [
                                                    new BoxShadow(
                                                      color:
                                                          Colors.green.shade100,
                                                      blurRadius: 2.0,
                                                    ),
                                                  ],
                                                ),
                                              
                                              
                                              
                                              ), */

  /*  Column(
                                                children: [
                                                  Text(
                                                    state.products[index]
                                                            .summary ??
                                                        'Empty',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ) */
  Container _buildProductScreen(List<ProductModel> data) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text(data.first.name)],
      ),
    );
  }
}
