import 'package:get/get.dart';
import 'package:rick_morty/pages/character/character_controller.dart';

/// A binding class for the Character page, which initializes the CharacterController.
class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterController());
  }
}