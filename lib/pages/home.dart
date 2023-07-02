import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/components/SingleProduct.dart';
import 'package:online_shopping/models/Product.dart';
import 'package:online_shopping/pages/cart.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: false,
        title: const Text(
          "Shopping",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              icon: Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 0, 0, 0),
              ))
        ],
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
        child: (BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            BlocProvider.of<ProductBloc>(context).add(LoadProductEvent());
          

            List<Product> products_list = [];
            if (state is ProductState) {
              products_list = [...state.products];
            }

            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ...(products_list).map(
                      (element) {
                        return SingleProduct(product_: element);
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
