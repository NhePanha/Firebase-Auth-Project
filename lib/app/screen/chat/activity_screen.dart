import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new)),
                  const Text("Activity",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Icon(Icons.assignment),
                ],
              ),
              const SizedBox(height: 20),

              // Balance & Chart
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.purple.shade100, Colors.white]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Current Balance",
                            style: TextStyle(color: Colors.grey)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ],
                          ),
                          child: const Row(
                            children: [
                              Text("Month"),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("\$4,570.80",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 180,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: 60,
                              sections: [
                                PieChartSectionData(
                                    value: 30,
                                    color: Colors.deepPurple,
                                    radius: 40),
                                PieChartSectionData(
                                    value: 25,
                                    color: Colors.purple.shade300,
                                    radius: 40),
                                PieChartSectionData(
                                    value: 20,
                                    color: Colors.indigo,
                                    radius: 40),
                                PieChartSectionData(
                                    value: 25,
                                    color: Colors.deepPurple.shade200,
                                    radius: 40),
                              ],
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("\$2,482",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text("Your savings",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Menu
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  QuickMenuCard(
                      icon: Icons.account_balance_wallet,
                      title: "Top up\nwallet money"),
                  SizedBox(width: 8),
                  QuickMenuCard(
                      icon: Icons.pie_chart, title: "Create\nwallet budget"),
                  SizedBox(width: 8),
                  QuickMenuCard(icon: Icons.credit_card, title: "Lock\ncard"),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Payment History",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("See all", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class QuickMenuCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickMenuCard({required this.icon, required this.title, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.white, Colors.deepPurple.shade50]),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.deepPurple, size: 30),
            const SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
