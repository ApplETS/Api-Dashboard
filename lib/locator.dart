// FLUTTER / DART / THIRD-PARTIES
import 'package:get_it/get_it.dart';

// SERVICES
import 'package:api_dashboard/core/services/navigation_service.dart';
import 'package:api_dashboard/core/services/user_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserRepository());
}
