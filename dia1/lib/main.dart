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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tepeaca Puebla",
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.deepPurpleAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Llamanos",
                        style: TextStyle(color: Colors.deepPurpleAccent)),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.route,
                    color: Colors.deepPurpleAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text("Ruta",
                        style: TextStyle(color: Colors.deepPurpleAccent)),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Icon(
                      Icons.share,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  Text(
                    "Compartir",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
            child: Text(
                "El municipio de Tepeaca colinda al norte con los municipios de Acajete y Nopalucan; al este con los municipios de Acatzingo, Los Reyes de Juárez y Cuapiaxtla de Madero; al sur con los municipios de Santo Tomás Hueyotlipan y Mixtla; y al oeste con los municipios de Tecali de Herrera y Cuautinchán.",
                textAlign: TextAlign.justify))
      ]))),
    );
  }
}
