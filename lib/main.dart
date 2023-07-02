import 'package:online_shopping/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shopping/bloc/product_bloc.dart';
import 'package:online_shopping/repository/repository.dart';

import 'bloc/product_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
              ProductRepository(), "https://fakestoreapi.com/products"),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
