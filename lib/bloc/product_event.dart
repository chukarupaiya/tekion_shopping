import 'package:flutter/cupertino.dart';
import 'package:online_shopping/models/Product.dart';

@immutable
abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

abstract class CartEvent {}

class InitializeCartEvent extends CartEvent{}

class AddCartEvent extends CartEvent {
  final Product product;

  AddCartEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
