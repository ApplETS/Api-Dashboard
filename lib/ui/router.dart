// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// VIEWS
import 'package:api_dashboard/ui/views/signin_view.dart';

// OTHERS
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:api_dashboard/core/services/analytics_service.dart';
import 'package:api_dashboard/locator.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final AnalyticsService analyticsService = locator<AnalyticsService>();

    // log manual because FirebaseAnalytics for web doesn't support yet the automatic log.
    analyticsService.logNavigateTo(routeSettings.name);
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
