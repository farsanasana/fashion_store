import 'package:fashion_store/app/cart/controller/cart-controller.dart';
import 'package:fashion_store/app/cart/view/add_address.dart';
import 'package:fashion_store/app/cart/view/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
   final CartController cartController = Get.find();


    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),

        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.3,
      ),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? const Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "${item.price} • Size: ${item.size}",
                        style: const TextStyle(
                            fontSize: 13, color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => cartController.removeItem(item),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemCount: cartController.cartItems.length,
              ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Total: ${cartController.totalPrice.value.toStringAsFixed(2)} AED",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 55,
                width: 225,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar(
                      "Checkout",
                      "Proceeding to checkout...",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    // Navigate to checkout page or perform checkout actions
                    Get.to(() => const AddAddressPage());
                 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 15, 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                          shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // optional: smoother edges
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
