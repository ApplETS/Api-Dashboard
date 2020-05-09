// FLUTTER / DART / THIRD-PARTIES
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:flutter/material.dart';

// SERVICES
import 'package:api_dashboard/core/services/navigation_service.dart';
import 'package:api_dashboard/locator.dart';

// OTHER
import 'package:api_dashboard/core/view_models/base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final navigationService = locator<NavigationService>();

  String _email;
  String _password;

  bool get isSubmitEnabled => _email != null && _password != null;

  String emailValidator(String value) {
    RegExp regExp =
        RegExp(r'([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})');

    if (value.length == 0) {
      _email = null;
      return 'Please enter your email.';
    } else if (!regExp.hasMatch(value)) {
      _email = null;
      return 'Please enter a valid email.';
    }

    _email = value;
    return null;
  }

  String passwordValidator(String value) {
    if (value.length == 0) {
      _password = null;
      return 'Please enter your password.';
    }
    _password = value;
    return null;
  }

  onSubmitPressed() {
    navigationService.navigateTo(RouterPaths.HOME);
  }

  onForgotPasswordPressed() {}
}
