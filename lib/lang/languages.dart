import 'package:get/get.dart';
import 'package:rick_morty/lang/strings.dart';

/// This class is used to store all the translations used in the app
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          Strings.textAppName: "RickMorty",

          /// Character Page
          Strings.textCharacters: "Characters",
          Strings.textNoInternetConnection: "No internet connection",
          Strings.textNoCharacters: "No Characters Available",
        },
      };
}
