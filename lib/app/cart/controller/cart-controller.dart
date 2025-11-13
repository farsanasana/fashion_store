// import 'package:get/get.dart';
// import 'package:fashion_store/app/detailed_page/model/product_model.dart';

// class CartController extends GetxController {
//   var cartItems = <Product>[].obs;
//   var totalPrice = 0.0.obs;

//   void addItem(Product product) {
//     cartItems.add(product);
//     calculateTotal();
//   }

//   void removeItem(Product product) {
//     cartItems.remove(product);
//     calculateTotal();
//   }

//   void calculateTotal() {
//     double total = 0;
//     for (var item in cartItems) {
//       final price = double.tryParse(item.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
//       total += price;
//     }
//     totalPrice.value = total;
//   }
// }
import 'package:get/get.dart';

class CartItem {
  final String name;
  final String image;
  final String price;
  final String size;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    required this.size,
  });
}

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var totalPrice = 0.0.obs;

  void addItem(CartItem item) {
    cartItems.add(item);
    calculateTotal();
  }

  void removeItem(CartItem item) {
    cartItems.remove(item);
    calculateTotal();
  }

  void calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      final price =
          double.tryParse(item.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
      total += price;
    }
    totalPrice.value = total;
  }
}
