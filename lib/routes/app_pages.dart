import 'package:get/get.dart';
import 'package:rick_morty/pages/character/character_binding.dart';
import 'package:rick_morty/pages/character/character_view.dart';
import 'package:rick_morty/pages/splash/splash_binding.dart';
import 'package:rick_morty/pages/splash/splash_view.dart';
import 'package:rick_morty/routes/app_routes.dart';

/// A class that manages the routes of the application.
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.routeSplash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.routeCharacter,
      page: () => CharacterView(),
      binding: CharacterBinding(),
    ),
  ];
}
