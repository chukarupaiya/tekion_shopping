import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/Product.dart';

class CartProduct extends StatefulWidget {
  final Product product_;
  final int? quantity;

  CartProduct({required this.product_, required this.quantity});

  @override
  State<CartProduct> createState() =>
      _CartProductState(product_: this.product_, quantity: this.quantity);
}

class _CartProductState extends State<CartProduct> {
  @override
  final Product product_;
  final int? quantity;

  _CartProductState({required this.product_, required this.quantity});

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 227, 227, 227),
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.network(product_.image),
            ),
          ),
          Column(
            children: [
              SizedBox(
                child: Container(
                    width: 190,
                    margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Text(
                      product_.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              SizedBox(
                child: Container(
                    width: 190,
                    margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: Text(
                      product_.price+"\$",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 2, 153, 68),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: const Text(
                      "quantity",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              SizedBox(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      quantity.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
