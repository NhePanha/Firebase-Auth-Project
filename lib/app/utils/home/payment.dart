import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final Color color;
  final String title;
  final String amount;
  final String daysLeft;
  final IconData icon;
  final Color textColor;

  const PaymentCard({
    required this.color,
    required this.title,
    required this.amount,
    required this.daysLeft,
    required this.icon,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: color == Colors.white
            ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor),
          const SizedBox(height: 10),
          Text(title,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          Text(amount, style: TextStyle(color: textColor)),
          Text(daysLeft, style: TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    );
  }
}
