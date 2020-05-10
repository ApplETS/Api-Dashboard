// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter/material.dart';

// SERVICES
import 'package:api_dashboard/core/services/navigation_service.dart';
import 'package:api_dashboard/core/services/user_repository.dart';
import 'package:api_dashboard/locator.dart';

// OTHER
import 'package:api_dashboard/core/view_models/base_view_model.dart';
import 'package:api_dashboard/core/constants/router_paths.dart';

class SignInViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final navigationService = locator<NavigationService>();
  final userRepository = locator<UserRepository>();

  String _email;
  String _password;

  bool get isSubmitEnabled => _email != null && _password != null;

  String _errorMessage;
  String get error => _errorMessage;

  String emailValidator(String value) {
    RegExp regExp =
        RegExp(r'([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})');

    if (value.length == 0) {
      _email = null;
      return 'enterEmailError';
    } else if (!regExp.hasMatch(value)) {
      _email = null;
      return 'invalidEmail';
    }

    _email = value;
    return null;
  }

  String passwordValidator(String value) {
    if (value.length == 0) {
      _password = null;
      return 'enterPasswordError';
    }
    _password = value;
    return null;
  }

  onSubmitPressed() async {
    setBusy(true);
    var result = await userRepository.signInWithEmail(email: _email, password: _password);
    if(result == "auth/user-not-found")
      _errorMessage = "userNotFound";
    else if(!result)
      _errorMessage = "oups";
    else if(result)
      navigationService.navigateTo(RouterPaths.HOME);
    setBusy(false);
  }

  onForgotPasswordPressed() {}
}
