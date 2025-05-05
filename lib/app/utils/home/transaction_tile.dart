import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final IconData icon;

  const TransactionTile({
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // You can add navigation here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
      leading: CircleAvatar(
        child: Icon(icon, color: Colors.white),
        backgroundColor: Colors.deepPurple,
      ),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(amount,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}

class PaymentDetailScreen extends StatelessWidget {
  final String title;

  const PaymentDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text("Details for $title", style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
