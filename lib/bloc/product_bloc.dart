import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'product_state.dart';
import 'product_event.dart';
import 'package:online_shopping/repository/repository.dart';
import 'package:online_shopping/models/Product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  final String endpoint;

  ProductBloc(this._productRepository, this.endpoint) : super(ProductState(products: [])) {
    
    
    on<LoadProductEvent>((event, emit) async {
      try {
        final temp = await _productRepository.getProducts(endpoint);
        emit(ProductState(products: temp));
      } catch (e) {
        print(e);
        print("some thing went wrong");
      }
    });

  }
}


class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartState(cart: {})) {

    on<AddCartEvent>((event, emit) async {
      try {
        
        if (state is CartState) {

          Map<Product,int?> map=(state as CartState).cart;
          int? val=map[event.product];
          if(val!=null){
            val++;
          }

          if(map.containsKey(event.product)){
            map.update(event.product, (value) => val);
          }else{
            map.putIfAbsent(event.product, () => 1);
          }
          print(map);
          emit(CartState(cart: map));
        }
      } catch (e) {
        print(e);
        print("Something went wrong while adding the product to the cart");
      }
    });
    
  }
}
