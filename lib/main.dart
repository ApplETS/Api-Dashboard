// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// ROUTER
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:api_dashboard/ui/router.dart';

// THEME
import 'package:api_dashboard/ui/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App|ETS Dashboard',
      theme: ApplETSTheme.lightTheme,
      initialRoute: RouterPaths.SIGN_IN,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
