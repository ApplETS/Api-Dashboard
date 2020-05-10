// FLUTTER / DART / THIRD-PARTIES
import 'package:api_dashboard/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final CollectionReference _usersCollection = Firestore.instance.collection('users');

  User _user;
  User get user => _user;

  /// Sign in the user using Firebase
  ///
  /// Will return:
  ///  - true if the authentication is successful
  ///  - a [String] if a error is catch
  ///  - false if something wrong happened but we were not able to have a explicit error
  Future signInWithEmail({@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      await _fetchUserProfile(authResult.user.uid);

      return _user != null;
    } catch (e) {
      return e.code;
    }
  }

  /// Fetch the profile of the user in Firestore
  ///
  /// Will return:
  ///  - true if the fetch is successful
  ///  - a [String] if a error is catch
  ///  - false if something wrong happened but we were not able to have a explicit error
  Future _fetchUserProfile(String uid) async {
    try {
      var userDataFetched = await _usersCollection.document(uid).get();

      _user = User.fromJson(userDataFetched.data);
      return _user != null;
    } catch (e) {
      print(e);
      return e.code;
    }
  }
}
