import 'package:flutter/material.dart';

void main() => runApp(const FinanceDevApp());

class FinanceDevApp extends StatelessWidget {
  const FinanceDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(title: const Text('Finance Dev Mode')),
        body: const Center(child: Text('Dev mode scaffold ready')),
      ),
    );
  }
}
