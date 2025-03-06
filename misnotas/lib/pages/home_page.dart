import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.2),
                  itemCount: noteList.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = noteList[index];
                    return Text(document['title']);
                  });
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
