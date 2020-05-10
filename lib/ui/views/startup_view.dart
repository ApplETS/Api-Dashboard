// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// VIEW MODEL
import 'package:api_dashboard/core/view_models/startup_view_model.dart';

// WIDGETS
import 'package:api_dashboard/ui/utils/base_view.dart';

// OTHER
import 'package:api_dashboard/ui/utils/theme.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<StartUpViewModel>(
      model: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ApplETSTheme.violet,
        body: Center(
          child: Hero(
            tag: 'logo',
            child: SizedBox(
              width: 200,
              height: 100,
              child: Image.asset('assets/images/white_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
  
}
