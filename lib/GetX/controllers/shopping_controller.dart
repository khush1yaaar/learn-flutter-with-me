import 'package:get/get.dart';
import '../models/products.dart';

class ShoppingController extends GetxController {
  // Correct way to create an observable list of products
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    List<Product> productResult = [
      Product(
        id: 1,
        productName: "Smartphone",
        productImage: "smartphone.png",
        productDescription: "Latest model with high-end specs.",
        price: 799.99,
      ),
      Product(
        id: 2,
        productName: "Laptop",
        productImage: "laptop.png",
        productDescription: "Powerful laptop with sleek design.",
        price: 1299.99,
      ),
      Product(
        id: 3,
        productName: "Headphones",
        productImage: "headphones.png",
        productDescription: "Noise-cancelling over-ear headphones.",
        price: 199.99,
      ),
      Product(
        id: 4,
        productName: "Smartwatch",
        productImage: "smartwatch.png",
        productDescription: "Stylish smartwatch with fitness tracking.",
        price: 299.99,
      ),
      Product(
        id: 5,
        productName: "Camera",
        productImage: "camera.png",
        productDescription: "High-resolution digital camera.",
        price: 499.99,
      ),
    ];
    products.value = productResult;
  }
}
