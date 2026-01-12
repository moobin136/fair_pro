import 'package:flutter/material.dart';

class ExpanceTraker extends StatefulWidget {
  const ExpanceTraker({super.key});

  @override
  State<ExpanceTraker> createState() => _ExpanceTrakerState();
}

class _ExpanceTrakerState extends State<ExpanceTraker> {
  final List<ExpanceTraker> expnaceList = [];
  final List<String> cetagor = ["Food", "Firs Food", "Tranepor", "Bills"];
  double _total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expance App'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
    );
  }
}
