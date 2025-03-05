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
      body: Center(
        child: Column(
          children: [
            Image.network("https://thispersondoesnotexist.com/"),
            Text(
              'Calls',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
