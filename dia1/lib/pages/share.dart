import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Share',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}