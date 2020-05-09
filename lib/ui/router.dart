
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:api_dashboard/ui/views/signin_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterPaths.HOME:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Home view")),
        )
        );
      case RouterPaths.SIGN_IN:
        return MaterialPageRoute(
          builder: (_) => SignInView()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Oups! Page not found to ${routeSettings.name}")),
          )
        );
    }
  }
}
