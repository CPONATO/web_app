import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_ap/global_variable.dart';
import 'package:web_ap/models/product.dart';
import 'package:web_ap/services/manage_http_response.dart';

class ProductController {
  Future<List<Product>> loadProducts() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/products'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Product> products =
            data.map((product) => Product.fromJson(product)).toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error loading products: $e');
    }
  }

  // Update product status (popular/recommend)
  updateProductStatus({
    required String productId,
    required bool popular,
    required bool recommend,
    required context,
  }) async {
    try {
      http.Response response = await http.patch(
        Uri.parse('$uri/api/products/$productId/status'),
        body: jsonEncode({'popular': popular, 'recommend': recommend}),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product status updated successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, 'Error updating product: $e');
    }
  }
}
