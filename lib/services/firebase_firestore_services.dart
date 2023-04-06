import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/utils/flutter_toast.dart';

class FirebaseFirestoreService {
  static CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  static Future<void> createOrEditProduct(
    String id,
    String name,
    int price,
  ) async {
    products
        .doc('1')
        .set({
          "id": id,
          "name": name,
          "price": price,
        }, SetOptions(merge: true))
        .then(
          (value) => FlutterToast.showToast("Product Updated"),
        )
        .catchError(
          (onError) =>
              FlutterToast.showToast("Failed Updated Product: $onError"),
        );
  }

  static Future<DocumentSnapshot<Object?>> getProductById(String id) async {
    return await products.doc(id).get();
  }

  static Future<void> deleteProducById(String id) async {
    return await products.doc(id).delete();
  }
}
