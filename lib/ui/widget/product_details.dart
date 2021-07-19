import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/product_event.dart';
import 'package:kazang_demo/blocs/products_bloc.dart';
import 'package:kazang_demo/blocs/products_state.dart';
import 'package:kazang_demo/models/product_details_model.dart';
import 'package:kazang_demo/services/product_service.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              //padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                child: BlocProvider(
                    create: (context) => ProductsBloc()
                      ..add(ProductDaetailsEvent(productID: args.productID)),
                    child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (BuildContext context, state) {
                        print("state ${state.runtimeType.toString()}");
                        if (state is ProductsDetailsLoadSuccess) {
                          print("state ${state.runtimeType.toString()}");
                          return Column(
                            children: [
                              Container(
                                //color: Colors.black87,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 50,
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.85,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Carousel(
                                                    boxFit: BoxFit.cover,
                                                    autoplay: false,
                                                    animationCurve:
                                                        Curves.fastOutSlowIn,
                                                    animationDuration: Duration(
                                                        milliseconds: 1000),
                                                    dotSize: 10.0,
                                                    indicatorBgPadding: 4.0,
                                                    dotBgColor:
                                                        Colors.transparent,
                                                    dotIncreasedColor:
                                                        Color(0xFF2FF11E),
                                                    dotVerticalPadding: 40.0,
                                                    dotHorizontalPadding: 20,
                                                    images: state
                                                        .products.gallery
                                                        .map((images) {
                                                      return Image.network(
                                                        images,
                                                        fit: BoxFit.cover,
                                                      );
                                                    }).toList()),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                                bottom: 5,
                                                top: 15),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      state.products.name ?? '',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      state.products.summary ??
                                                          '',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      state.products
                                                              .description ??
                                                          '',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                    /*  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 50,
                                          bottom: 100),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.85,
                                        child: Carousel(
                                            boxFit: BoxFit.cover,
                                            autoplay: false,
                                            animationCurve:
                                                Curves.fastOutSlowIn,
                                            animationDuration:
                                                Duration(milliseconds: 1000),
                                            dotSize: 10.0,
                                            indicatorBgPadding: 4.0,
                                            dotBgColor: Colors.transparent,
                                            dotIncreasedColor:
                                                Color(0xFF2FF11E),
                                            dotVerticalPadding: 40.0,
                                            dotHorizontalPadding: 20,
                                            images: state.products.gallery
                                                .map((images) {
                                              return Image.network(
                                                images,
                                                fit: BoxFit.cover,
                                              );
                                            }).toList()),
                                      ),
                                    ),
                                   */
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Text(
                            "Loading .......",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          );
                        }
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
