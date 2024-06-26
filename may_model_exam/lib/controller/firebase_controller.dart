// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseController with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addData({required String name, required String phn}) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .collection("contacts")
            .add({"name": name, "phn": phn});
      }
    } catch (e) {
      print("object");
    }
  }

  // Future<void> addData({required String name, required String phn}) async {
  //   try {
  //     final user = auth.currentUser;
  //     if (user != null) {
  //       await FirebaseFirestore.instance
  //           .collection("users")
  //           .doc(user.uid)
  //           .collection('contacts')
  //           .add({
  //         'name': name,
  //         'phn': phn,
  //       });
  //     }
  //   } catch (e) {
  //     print("Failed to add data: $e");
  //   }
  // }
  // Future<void> addData({required String name, required String phn}) async {
  //   try {
  //     final user = auth.currentUser;
  //     if (user != null) {
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .collection('contacts')
  //           .add({'name': name, 'phn': phn});
  //     }
  //   } catch (e) {
  //     print("object");
  //   }
  // }

  Future<void> updateData(
      {required String id, required String name, required String phn}) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .collection('contacts')
            .doc(id)
            .update({
          'name': name,
          'phn': phn,
        });
      }
    } catch (e) {
      print("Failed to update data: $e");
    }
  }
  // Future<void> updateData(
  //     {required String id, required String name, required String phn}) async {
  //   try {
  //     final user = auth.currentUser;
  //     if (user != null) {
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .collection('contacts')
  //           .doc(id)
  //           .update({'phn': phn, 'name': name});
  //     }
  //   } catch (e) {
  //     print("object");
  //   }
  // }

  Future<void> deleteData(String id) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .collection('contacts')
            .doc(id)
            .delete();
      }
    } catch (e) {
      print("Failed to delete data: $e");
    }
  }
  // Future<void> deleteData(String id) async {
  //   try {
  //     final user = auth.currentUser;
  //     if (user != null) {
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .collection('contacts')
  //           .doc(id)
  //           .delete();
  //     }
  //   } catch (e) {
  //     print("");
  //   }
  // }

  Stream<QuerySnapshot> getData() {
    final user = auth.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection('contacts')
          .snapshots();
    }
    return const Stream.empty();
  }
}
