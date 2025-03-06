import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Obtener la coleccion de mi proyecto si la coleccion exite se usa, sino se crea
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('mynotes');

  //Crear un registro
  Future<void> addNote(String note) {
    return notes
        .add({'title': note, 'details': note, 'timestamp': Timestamp.now()});
  }

  //Extraer o leer los datos de mi coleccion
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }
}
