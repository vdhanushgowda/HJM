import 'package:flutter/material.dart';
import 'package:jala/Cart/CartManager.dart'; // Import CartManager

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager().getCartItems(); // Fetch cart items

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: cartItems.isNotEmpty
          ? ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index]['product'] as Map<String, dynamic>;
          final quantity = cartItems[index]['quantity'] as int;

          return ListTile(
            leading: Image.asset(
              item['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item['itemName']!),
            subtitle: Text("Quantity: $quantity"),
            trailing: Text("\$${item['price']}"),
          );
        },
      )
          : Center(
        child: Text("Your cart is empty."),
      ),
    );
  }
}
