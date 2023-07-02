import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:online_shopping/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_shopping/pages/cart.dart';

class ProductState {
  final List<Product> products;

  ProductState({required this.products});

  @override
  List<Object?> get props => [products];
}

class CartState {
  final Map<Product, int?> cart;

  CartState({required this.cart});

  @override
  List<Object?> get props => [];
}

