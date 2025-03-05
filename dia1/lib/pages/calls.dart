import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calls'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Calls',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
