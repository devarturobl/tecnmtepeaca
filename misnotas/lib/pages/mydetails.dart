import 'package:flutter/material.dart';
import 'package:misnotas/services/firebase_options.dart';

class Mydetails extends StatefulWidget {
  final Color color;
  final String mitexto;
  final String docID;

  const Mydetails(
      {super.key,
      required this.color,
      required this.mitexto,
      required this.docID});

  @override
  State<Mydetails> createState() => _MydetailsState();
}

class _MydetailsState extends State<Mydetails> {
  final FirestoreService firestoreService = FirestoreService();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el texto recibido
    textController = TextEditingController(text: "${widget.mitexto}\n");
  }

   @override
  void dispose() {
    textController.dispose(); // Libera el controlador cuando se cierra la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar Nota"),
          backgroundColor: widget.color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: textController,
            maxLines: null, // Permite múltiples líneas
            keyboardType: TextInputType.multiline,
            style: const TextStyle(fontSize: 18), // Tamaño del texto
            decoration: const InputDecoration(
              hintText: "Escribe tu nota aquí...",
              border:
                  InputBorder.none, // Sin borde para una experiencia más limpia
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            firestoreService.updateDetails(widget.docID, textController.text);
            Navigator.pop(context);
          },
          backgroundColor: widget.color,
          child: Icon(Icons.save),
        ));
  }
}
