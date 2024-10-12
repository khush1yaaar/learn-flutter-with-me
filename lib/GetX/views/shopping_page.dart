import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socials/GetX/controllers/cart_controller.dart';
import 'package:socials/GetX/views/cart_page.dart';
import '../controllers/shopping_controller.dart';
import '../models/products.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Shopping Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100, // Adjust the height as needed
                          child: ListTile(
                            title: Text(product.productName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.productDescription),
                                const SizedBox(height: 5), // Add some space between description and price
                                Text(
                                  '\$${product.price}', // Display the price here
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green, // Change the color as needed
                                  ),
                                ),
                              ],
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                // Add your add to cart logic here
                                Get.snackbar("Success", "${product.productName} added to cart!");
                                cartController.addToCart(controller.products[index]);
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.blue),
                              ),
                              child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: GetX<CartController>(
                builder: (controller) {
                  return Text('Total amount: \$${controller.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),);
                },
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
        floatingActionButton: GetX<CartController>(
          builder: (controller) {
            return FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed functionality here
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())
                ); // Navigate to the cart page or show cart details
              },
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add_shopping_cart_rounded),
              label: Text('${controller.count}'),
            );
          }
        ),
    );
  }
}
