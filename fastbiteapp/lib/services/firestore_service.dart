import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<DocumentSnapshot>> fetchPaginatedData({
  required CollectionReference collection,
  DocumentSnapshot? startAfter,
  int limit = 10,
}) async {
  Query query = collection.orderBy('field').limit(limit);
  if (startAfter != null) {
    query = query.startAfterDocument(startAfter);
  }
  QuerySnapshot snapshot = await query.get();
  return snapshot.docs;
}
