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
                      height: 350,
                      child: BlocProvider(
                        create: (context) =>
                            ProductsBloc()..add(ProductRequestedEvent()),
                        child: BlocBuilder<ProductsBloc, ProductsState>(
                          builder: (BuildContext context, state) {
                            if (state is ProductsLoadSuccess) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int i) {
                                  return InkWell(
                                      onTap: () {},
                                      child: Text(state.products[i].name));
                                },
                                itemCount: state.products.length,
                              );
                            } else {
                              return Center(
                                child: Text("Product is Empty"),
                              );
                            }
                          },
                        ),
                      ),
                      /*  child: BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (BuildContext context, state) {
                          if (state is ProductsLoadSuccess) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                    onTap: () {},
                                    child:
                                        Text('state.products[i].name ?? ' ''));
                              },
                              itemCount: state.products.length,
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

                  /*   Flexible(
                      child: BlocProvider<ProductsBloc>(
                    create: (context) =>
                        ProductsBloc()..add(ProductRequestedEvent()),
                    child: ProductComponent(),
                  )) */
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
