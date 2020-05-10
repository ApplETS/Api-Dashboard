
import 'package:api_dashboard/core/constants/router_paths.dart';
import 'package:api_dashboard/core/services/navigation_service.dart';
import 'package:api_dashboard/core/services/user_repository.dart';
import 'package:api_dashboard/core/view_models/base_view_model.dart';
import 'package:api_dashboard/locator.dart';

class StartUpViewModel extends BaseViewModel {
  final UserRepository _userRepository = locator<UserRepository>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _userRepository.isUserSignedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(RouterPaths.DASHBOARD);
    } else {
      _navigationService.navigateTo(RouterPaths.SIGN_IN);
    }
  }
}
