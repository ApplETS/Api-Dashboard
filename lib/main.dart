// FLUTTER / DART / THIRD-PARTIES
import 'package:api_dashboard/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ROUTER
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:api_dashboard/ui/router.dart';

// THEME
import 'package:api_dashboard/ui/utils/theme.dart';

// OTHER
import 'package:api_dashboard/locator.dart';
import 'generated/l10n.dart';

void main() {
  // Register all the services
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App|ETS Dashboard',
      theme: ApplETSTheme.lightTheme,
      navigatorKey: locator<NavigationService>().navigationKey,
      initialRoute: RouterPaths.START_UP,
      onGenerateRoute: Router.generateRoute,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
