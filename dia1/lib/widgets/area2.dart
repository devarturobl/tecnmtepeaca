import 'package:dia1/pages/calls.dart';
import 'package:dia1/pages/routes.dart';
import 'package:dia1/pages/share.dart';
import 'package:flutter/material.dart';

class Area2 extends StatelessWidget {
  const Area2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calls()));
                },
                child: Icon(
                  Icons.call,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Calls",
                    style: TextStyle(color: Colors.deepPurpleAccent)),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Routes()));
                },
                child: Icon(
                  Icons.route,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Route",
                    style: TextStyle(color: Colors.deepPurpleAccent)),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Share()));
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Text(
                "Share",
                style: TextStyle(color: Colors.deepPurpleAccent),
              )
            ],
          ),
        ],
      ),
    );
  }
}
