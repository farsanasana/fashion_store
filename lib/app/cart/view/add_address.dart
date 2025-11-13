import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Address"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField("House Name"),
            buildTextField("Street / Area"),
            buildTextField("Landmark"),
            buildTextField("Pincode"),
            Row(
              children: [
                Expanded(child: buildTextField("City")),
                const SizedBox(width: 10),
                Expanded(child: buildTextField("State")),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Contact Details", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            buildTextField("Full Name"),
            buildTextField("Phone Number"),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => 
                Get.toNamed('/addressBook'
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text("SAVE", style: TextStyle(color: Colors.white, fontSize: 16)),
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
