import 'package:flutter/material.dart';

class Area1 extends StatelessWidget {
  const Area1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tepeaca Puebla, México",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Se localiza en la Sierra de San Jerónimo",
              style: TextStyle(color: Colors.blueGrey),
            )
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text("41")
          ],
        )
      ],
    );
  }
}

