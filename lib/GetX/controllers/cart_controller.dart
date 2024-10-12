import 'package:get/get.dart';
import '../models/products.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;

  double get totalAmount => cartItems.fold(0, (sum, item) => sum += item.price);

  void addToCart(Product product) {
    cartItems.add(product);
  }
}