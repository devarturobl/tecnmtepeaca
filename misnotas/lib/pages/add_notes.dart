import 'package:flutter/material.dart';
import 'package:misnotas/services/firebase_options.dart';


class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final FirestoreService firestoreService = FirestoreService();
  //Declaro un textcontroller esto es un espacio de memoria que requieren los widgets TextField
  final TextEditingController textController = TextEditingController();
  final TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                maxLines: null, // Permite múltiples líneas
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontSize: 18), // Tamaño del texto
                decoration: const InputDecoration(
                  hintText: "Escribe Titulo...",
                  border: InputBorder
                      .none, // Sin borde para una experiencia más limpia
                ),
              ),
              TextField(
                controller: textController2,
                maxLines: null, // Permite múltiples líneas
                keyboardType: TextInputType.multiline,
                style: const TextStyle(fontSize: 18), // Tamaño del texto
                decoration: const InputDecoration(
                  hintText: "Escribe tu nota aquí...",
                  border: InputBorder
                      .none, // Sin borde para una experiencia más limpia
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            firestoreService.addNote(textController.text, textController2.text);
            Navigator.pop(context);
          },
          child: Icon(Icons.save),
        ));
  }
}
