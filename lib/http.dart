import 'package:http/http.dart' as http;
import 'dart:convert';

class CartService {
  final String baseUrl = 'http://localhost:8080/products';

  // Fetch cart items
  Future<List> fetchCartItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  // Add item to cart
  Future<void> addItemToCart(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add item to cart');
    }
  }

  // Update item quantity
  Future<void> updateItemQuantity(int id, int quantity) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'quantity': quantity}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update item quantity');
    }
  }

  // Remove item from cart
  Future<void> removeItemFromCart(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/remove/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove item from cart');
    }
  }
}