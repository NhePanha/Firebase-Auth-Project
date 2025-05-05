import 'package:flutter/material.dart';
import 'package:project_test/app/screen/chat/activity_screen.dart';
import 'package:project_test/app/screen/settings/settings_screen.dart';
import 'package:project_test/app/utils/home/payment.dart';
import 'package:project_test/app/utils/home/transaction_tile.dart';

class WalletHomeScreen extends StatefulWidget {
  @override
  _WalletHomeScreenState createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation or actions based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home

        break;
      case 1:
        // Navigate to Credit Card
        break;
      case 2:
        // Navigate to QR Code Scanner
        break;
      case 3:
        // Navigate to Bar Chart
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ActivityScreen()));
        break;
      case 4:
        // Navigate to Settings
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello,", style: TextStyle(fontSize: 18)),
                      Text("Siyam Ahmed!",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.search, size: 28),
                      SizedBox(width: 16),
                      Icon(Icons.notifications, size: 28),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.purpleAccent]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Balance",
                            style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 8),
                        Text("\$4,570.80",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(Icons.add_circle_outline,
                        color: Colors.white, size: 30),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming payment",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PaymentDetailScreen(
                                  title: "Adobe Premium")),
                        );
                      },
                      child: const PaymentCard(
                        color: Colors.deepPurple,
                        title: "Adobe Premium",
                        amount: "\$30/month",
                        daysLeft: "2 days left",
                        icon: Icons.ac_unit,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: PaymentCard(
                      color: Colors.white,
                      title: "Apple Premium",
                      amount: "\$30/month",
                      daysLeft: "2 days left",
                      icon: Icons.apple,
                      textColor: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              const TransactionTile(
                  title: "Apple Inc.",
                  amount: "-\$230.50",
                  date: "21 Sep, 03:02 PM",
                  icon: Icons.apple),
              const TransactionTile(
                  title: "Adobe",
                  amount: "-\$130.50",
                  date: "21 Sep, 03:22 PM",
                  icon: Icons.ac_unit),
              const TransactionTile(
                  title: "Amazon",
                  amount: "-\$20.50",
                  date: "21 Sep, 02:02 PM",
                  icon: Icons.shopping_cart),
            ],
          ),
        ),
      ),
    );
  }
}
