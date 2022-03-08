import 'package:get_it/get_it.dart';
import 'package:merchant_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

/// Setup Locator creates a singleton navigation service in order to navigate between pages
void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
