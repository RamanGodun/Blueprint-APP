import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  /// Holds a reference to a specific Firestore collection.
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('collection_name');

  /// Adds a new item to the Firestore collection with a timestamp.
  /// [itemName] - Name of the item to be added.
  Future<void> addItem(String itemName) {
    return collectionRef.add({
      'itemName': itemName,
      'timeStamp': Timestamp.now(),
    });
  }

  /// Retrieves a stream of QuerySnapshot from the Firestore collection.
  /// Useful for real-time updates in the UI.
  Stream<QuerySnapshot> getItems() {
    return collectionRef.snapshots();
  }

  /// Updates the name of an existing item in the Firestore collection.
  /// [itemId] - Document ID of the item to update.
  /// [newName] - New name to update the item with.
  Future<void> updateItem(String itemId, String newName) {
    return collectionRef.doc(itemId).update({'itemName': newName});
  }

  /// Deletes an item from the Firestore collection.
  /// [itemId] - Document ID of the item to delete.
  Future<void> deleteItem(String itemId) {
    return collectionRef.doc(itemId).delete();
  }
}

/*
To call these methods from UI widgets, you can interact with instances of FirestoreService.
For example, to add an item, you can use:

FirestoreService().addItem("New Item Name").then((_) {
  print("Item added successfully!");
}).catchError((error) {
  print("Failed to add item: $error");
});

To display items in your app, you might use a StreamBuilder widget to listen to the stream provided by getItems() method.
*/
