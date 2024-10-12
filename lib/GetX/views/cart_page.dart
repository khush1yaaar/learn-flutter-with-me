import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.find<CartController>(); // Access the CartController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.teal,
      ),
      body: Obx(() {
        // Use Obx to reactively update the UI when the cart changes
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Text(
              'Your cart is empty!',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          );
        }

        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final product = cartController.cartItems[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(product.productName),
                subtitle: Text(product.productDescription),
                trailing: Text(
                  '\$${product.price.toStringAsFixed(2)}', // Display the price
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Change color as needed
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
