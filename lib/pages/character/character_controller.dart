import 'package:get/get.dart';
import 'package:rick_morty/api/api_provider.dart';
import 'package:rick_morty/api/character_model.dart';

/// A controller class for managing character-related logic.
class CharacterController extends GetxController {
  var characterList = <Character>[].obs;
  ApiProvider apiProvider = ApiProvider();

  @override
  void onInit(){
    super.onInit();
    fetchCharacters();
  }

  /// Function to fetch characters from API
  void fetchCharacters() async {
    final response = await apiProvider.getApi();

    if(response != null && response['results'] != null){
      CharacterModel characterModel = CharacterModel.fromJson(response);
      characterList.assignAll(characterModel.results ?? []);
    }
  }
}