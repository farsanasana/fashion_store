import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBookPage extends StatelessWidget {
  const AddressBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Book"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/addAddress'),
              child: Row(
                children: const [
                  Icon(Icons.add, color: Colors.redAccent),
                  SizedBox(width: 8),
                  Text(
                    "Add New Address",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Deliver To", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Checkbox(value: false, onChanged: null),
                        Text("Farsana Rahman C (HOME)", style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Text("Kp house, Pokunnu, Mankavu - 673655"),
                    const SizedBox(height: 4),
                    const Text("Mobile: +91 7012709504", style: TextStyle(fontWeight: FontWeight.w500)),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.edit, size: 18),
                            SizedBox(width: 5),
                            Text("Edit"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.delete_outline, size: 18),
                            SizedBox(width: 5),
                            Text("Delete"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("CONTINUE PAYMENT", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
