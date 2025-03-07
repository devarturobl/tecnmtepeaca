import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:misnotas/pages/add_notes.dart';
import 'package:misnotas/pages/mydetails.dart';
import 'package:misnotas/services/firebase_options.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  int bandera = 0;
  void cambioBandera() {
    if (bandera == 0) {
      setState(() {
        bandera = 1;
      });
    } else {
      setState(() {
        bandera = 0;
      });
    }
  }

  //Funcion para llamar a el formulario de registro de nota
  void openNote(String? docID, String? title) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Nota'),
              content: TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: title,
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                ElevatedButton.icon(
                  onPressed: () {
                    if (docID != null) {
                      firestoreService.updateNotes(docID, textController.text);
                      Navigator.pop(context);
                    } else {
                      //firestoreService.addNote(textController.text, textController.text);
                    }
                    textController.clear();
                  },
                  label: Text("Guardar"),
                  icon: Icon(Icons.save),
                )
              ],
            ));
  }

  void deleteNote(String docID) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("¿Deseas Eliminar la Nota?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestoreService.deleteNote(docID);
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
                padding: const EdgeInsets.all(10),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: noteList.length,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = noteList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Mydetails(
                            color: colores[index % colores.length],
                            mitexto: document['details'],
                            docID: document.id,
                          );
                        }));
                      },
                      onLongPress: () => deleteNote(document.id),
                      onDoubleTap: () =>
                          openNote(document.id, document['title']),
                      child: Hero(
                        tag: document.id,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                          color: colores[index % colores.length],
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  document['details'],
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  DateFormat('dd/MM/yyyy HH:mm').format(
                                    (document['timestamp'] as Timestamp)
                                        .toDate(),
                                  ),
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNotes()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
