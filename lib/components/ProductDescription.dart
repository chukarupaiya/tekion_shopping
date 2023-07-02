import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_shopping/components/Rating.dart';
import 'package:online_shopping/models/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/bloc/product_bloc.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              product.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Rating(
              value: double.parse(product.rating),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Text(
                product.price + "\$",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                product.description,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              foregroundColor: Colors.white, // foreground (text) color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(AddCartEvent(product: product));
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Add to cart  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
