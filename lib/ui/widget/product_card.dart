 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazang_demo/models/model_barel.dart'; 

class ProductCard extends StatelessWidget {
  final String backgroundImage; 
  final String title;
  final String description;
  final ProductModel listing;

  ProductCard({
    @required this.backgroundImage, 
    this.title,
    this.description,
    this.listing,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
 

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              ),
              image: backgroundImage == null
                  ? AssetImage(
                      "assets/images/adventure3.png",
                    )
                  : NetworkImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [ 
                    SizedBox(height: 4),
                    Text(
                      title,
                      style: textTheme.headline6.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: textTheme.headline6.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
