import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:misnotas/services/firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Heredar mi clase a firestoreService esta clase tendra el crud
  final FirestoreService firestoreService = FirestoreService();
  //Declaro un textcontroller esto es un espacio de memoria que requieren los widgets TextField
  final TextEditingController textController = TextEditingController();

  //Funcion para llamar a el formulario de registro de nota
  void openNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Nueva Nota'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {
                    firestoreService.addNote(textController.text);
                    textController.clear();
                    Navigator.pop(context);
                  },
                  label: Text("Guardar"),
                  icon: Icon(Icons.save),
                )
              ],
            ));
  }

  void deleteNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("¿Deseas Eliminar la Nota?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Si")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
            ));
  }

  final List<Color> colores = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App de Notas"),
      ),
      body: StreamBuilder(
          stream: firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> noteList = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.5),
                    itemCount: noteList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = noteList[index];
                      return GestureDetector(
                        onLongPress: () {
                          deleteNote();
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: colores[index % colores.length],
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  document['title'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy HH:mm').format(
                                    (document['timestamp'] as Timestamp)
                                        .toDate(),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            )),
                      );
                    }),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNote();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
