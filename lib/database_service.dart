import 'dart:developer';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';

class DatabaseService {
  final fire = FirebaseFirestore.instance;
  create(User user) {
    try {
      fire.
      collection("users")
          .add(user.toMap());
    } catch (e) {
      log(e) {
        log(e.toString());
      }
    }
  }

  read() async {
    try {
      //final data=fire.collection("users").doc("").get();
      // user.data();
      //this is used for the single data to fetch and we can able to read the single document file
      final data = await fire.collection("users").get();
      final user = data.docs[0];
      log(user["name"]);
      log(user["age"].toString());
    } catch (e) {
      log(e.toString());
    }
    update() {}
  }

  update() async {
    try {
      await fire.collection("users").doc("").update({
        "name": "wali",
        "age": 15,
        "address": "Islamabad",
      });
    } catch (e) {
      log(e.toString());
    }
  }

  delete() async {
    try {
      await fire.collection("users").doc("").delete();
    } catch (e) {
      log(e.toString());
    }
  }
}
