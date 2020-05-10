// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase/firebase.dart' as Firebase;

class AnalyticsService {
  final _analytics = Firebase.analytics();

  AnalyticsService() {
    // Report each flutter crash to analytics
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      if (kReleaseMode) {
        _analytics
            .logEvent("Flutter Crash", {'1': details.exceptionAsString()});
      }
    };
  }

  Future logNavigateTo(String name) async {
    _analytics.setCurrentScreen(name);
  }

  /// Inform firebase about the login of this user
  Future logSignIn({String uid, String role}) async {
    _analytics.setUserId(uid);
    _analytics.setUserProperties({'ROLE': role});
    _analytics.logEvent('sign_in', {'user signed in': uid});
  }

  /// Report a event to Firebase
  Future logEvent({String name, dynamic value}) {
    _analytics.logEvent(name, {name: value});
  }
}
