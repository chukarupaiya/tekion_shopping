import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/components/ProductDescription.dart';
import 'package:online_shopping/models/Product.dart';

import '../bloc/product_bloc.dart';
import 'cart.dart';

class ProductInfo extends StatefulWidget {
  final Product product_;
  const ProductInfo({required this.product_});

  @override
  State<ProductInfo> createState() => _ProductInfoState(product: product_);
}

class _ProductInfoState extends State<ProductInfo> {
  final Product product;

  _ProductInfoState({required this.product});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        actions: <Widget>[
          IconButton(
             onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (con) {
                    return BlocProvider.value(
                      value: BlocProvider.of<CartBloc>(context),
                      child: Cart(),
                    );
                  },
                ));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 0, 0, 0),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 182, 255, 235),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                padding: EdgeInsets.all(40),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 225, 225, 225),
                          blurRadius: 50,
                          offset: const Offset(0, 15))
                    ]),
                height: 450,
                width: double.infinity,
                child: Image.network(product.image),
              ),
              ProductDescription(product: product)
            ],
          ),
        ),
      ),
    );
  }
}
