// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool pop() {
    if(_navigationKey.currentState.canPop()) {
      _navigationKey.currentState.pop();
      return true;
    }
    return false;
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }
}
