/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/blocs/products_bloc.dart';
import 'package:kazang_demo/models/product_model.dart';

class ProductComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductState>(
      listener: (BuildContext context, ProductState state) {},
      builder: (context, state) {
        if (state is LoadingProduct) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Loading ....."),
              ]);
        } else if (state is ProductsLoadFailure) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('${state.error}'),
                ),
              ]);
        }
        if (state is ProductState) {
          if (state.products == null) {
            return Column(children: [
              Text('Loading ---'),
            ]);
          } else {
            List<ProductModel> productModel = state.products;
            return GridView(
              // shrinkWrap: true,
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                productModel.length,
                (index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 5),
                              child: Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        productModel[index].logo),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    SizedBox(height: 10),
                                    Text('',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                    SizedBox(height: 10),
                                    Text(" ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        } else {
          return Column(children: [
            Text('LOADING >>>>>>>..'),
          ]);
        }
      },
    );
  }
}
 */