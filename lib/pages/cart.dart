import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/bloc/product_bloc.dart';
import 'package:online_shopping/components/CartProduct.dart';

import '../bloc/product_state.dart';
import '../components/SingleProduct.dart';
import '../models/Product.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: false,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
       
        backgroundColor: Color.fromARGB(255, 232, 255, 252),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 232, 255, 252),
              Color.fromARGB(255, 164, 255, 231),
            ],
          ),
        ),
        child: (BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            List<Product> products_list =[];
            if (state is CartState) {
              products_list = [...state.cart.keys];
            }

            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ...(products_list).map(
                      (element) {
                        return CartProduct(product_: element,quantity:state.cart[element]);
                      },
                    ).toList(),
                    Center(
                      child: products_list.isEmpty
                          ? const Text(
                              "no result found",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            )
                          : const Text(""),
                    )
                  ],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
