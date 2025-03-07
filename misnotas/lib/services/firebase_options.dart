import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Obtener la coleccion de mi proyecto si la coleccion exite se usa, sino se crea
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('mynotes');

  //Crear un registro
  Future<void> addNote(String note, String details) {
    return notes
        .add({'title': note, 'details': details, 'timestamp': Timestamp.now()});
  }

  //Extraer o leer los datos de mi coleccion
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    //notes.snapshots();
    return notesStream;
  }

  //Actualizar registros
  Future<void> updateNotes(String docID, String title) {
    return notes.doc(docID).update({
      'title': title,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateDetails(String docID, String details) {
    return notes.doc(docID).update({
      'details': details,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
