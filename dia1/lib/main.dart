import 'package:dia1/widgets/area1.dart';
import 'package:dia1/widgets/area2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: SafeArea(
              child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 40.0),
          child: Image.asset(
            'lib/assets/descarga.jpg',
            width: double.infinity, // Ocupa todo el ancho disponible
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        Area1(),
        Area2(),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
            child: Text(
                "El municipio de Tepeaca colinda al norte con los municipios de Acajete y Nopalucan; al este con los municipios de Acatzingo, Los Reyes de Juárez y Cuapiaxtla de Madero; al sur con los municipios de Santo Tomás Hueyotlipan y Mixtla; y al oeste con los municipios de Tecali de Herrera y Cuautinchán.",
                textAlign: TextAlign.justify))
      ]))),
    );
  }
}
