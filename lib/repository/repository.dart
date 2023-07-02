import 'dart:convert';
import 'package:http/http.dart';
import 'package:online_shopping/models/Product.dart';

class ProductRepository {
  Future<List<Product>> getProducts(endpoint) async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      return result.map((e) {
        return Product.fromJson(e);
      }).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
