import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Routes"),),
      body: Center(child: Text("Routes", style: TextStyle(fontSize: 50),),),
    );
  }
}