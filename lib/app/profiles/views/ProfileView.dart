import 'package:flutter/material.dart';



class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text("My Account"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("FARSANA RAHMAN C",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("farsanarahmanc@gmail.com", style: TextStyle(color: Colors.grey)),
                Text("7012709504", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.95, backgroundColor: Colors.grey, color: Colors.red),
                SizedBox(height: 8),
                Text("Profile Completion: 95%", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Divider(),

          // Menu Options
          _buildMenuItem(Icons.shopping_bag_outlined, "My Orders"),
          _buildMenuItem(Icons.location_on_outlined, "Saved Address"),
          _buildMenuItem(Icons.card_giftcard, "Gift Vouchers"),
          _buildMenuItem(Icons.account_balance_wallet_outlined, "TSS Money (₹0)"),
          _buildMenuItem(Icons.star_border, "TSS Points (0)"),
          const Spacer(),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("LOG OUT", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("App Version 5.00.502", style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  





}
