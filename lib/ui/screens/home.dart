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
                      height: 700,
                      child: BlocProvider(
                        create: (context) =>
                            ProductsBloc()..add(ProductRequestedEvent()),
                        child: BlocBuilder<ProductsBloc, ProductsState>(
                          builder: (BuildContext context, state) {
                            if (state is ProductsLoadSuccess) {
                              return GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.0,
                                  crossAxisSpacing: 30.0,
                                  childAspectRatio: 0.8,
                                ),
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                physics: const ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: List.generate(state.products.length,
                                    (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0)),
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: Offset(1.1, 1.1),
                                            blurRadius: 10.0),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                bottom: 5),
                                            child: Container(
                                              height: 250,
                                              decoration: BoxDecoration(
                                                image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new NetworkImage(state
                                                          .products[index]
                                                          .logo ??
                                                      'No image available'),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, top: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    state.products[index].name),
                                                SizedBox(height: 10),
                                                Text(state.products[index]
                                                        .summary ??
                                                    'Summary Is empty')
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
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
      ),
    );
  }

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
