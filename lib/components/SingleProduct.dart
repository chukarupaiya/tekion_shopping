import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/bloc/product_bloc.dart';
import 'package:online_shopping/models/Product.dart';
import 'package:online_shopping/pages/ProductInfo.dart';

class SingleProduct extends StatefulWidget {
  final Product product_;

  SingleProduct({required this.product_});

  @override
  State<SingleProduct> createState() => _SingleProductState(product_: product_);
}

class _SingleProductState extends State<SingleProduct> {
  final Product product_;
  bool fav = false;

  _SingleProductState({required this.product_});

  void updateFav() {
    fav = !fav;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (con) {
            return BlocProvider.value(
              value: BlocProvider.of<ProductBloc>(context),
              child: ProductInfo(product_: this.product_),
            );
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        width: double.infinity,
        height: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 227, 227, 227),
                blurRadius: 5,
              )
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    product_.price.toString()+"\$",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      updateFav();
                    },
                    icon: fav
                        ? const Icon(
                            (Icons.favorite),
                            color: Color.fromARGB(255, 255, 0, 0),
                          )
                        : const Icon(
                            (Icons.favorite_border),
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.network(product_.image),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
          ],
        ),
      ),
    );
  }
}
