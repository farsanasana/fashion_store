import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPaymentPage extends StatelessWidget {
  const CardPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Payment"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField("Card Number"),
            buildTextField("Card Holder Name"),
            Row(
              children: [
                Expanded(child: buildTextField("Expiry Date")),
                const SizedBox(width: 10),
                Expanded(child: buildTextField("CVV")),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/paymentSuccess'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text("PAY NOW", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
