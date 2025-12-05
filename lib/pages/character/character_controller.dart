import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_morty/api/api_provider.dart';
import 'package:rick_morty/api/character_model.dart';
import 'package:rick_morty/global.dart';
import 'package:rick_morty/lang/strings.dart';

/// A controller class for managing character-related data and state.
class CharacterController extends GetxController {
  var page = 1;
  var characterList = <Character>[].obs;
  var characterLoading = true.obs;
  var hasMore = true.obs;

  String? nextPageUrl;
  final RefreshController refreshController =
  RefreshController(initialRefresh: false);

  ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  /// Function to handle pull-to-refresh action
  Future<void> onRefresh() async {
    fetchCharacters(refresh: true);
  }

  /// Function to handle load more action when scrolling to the bottom
  Future<void> onLoadMore() async {
    if (hasMore.value) {
      page++;
      fetchCharacters(loadMore: true);
    } else {
      refreshController.loadNoData();
    }
  }

  /// Function to fetch characters from the API
  void fetchCharacters({bool refresh = false, bool loadMore = false}) async {
    if (!await Global.checkInternetConnection()) {
      characterLoading.value = false;
      Global.customToast(message: Strings.textNoInternetConnection.tr);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      return;
    }

    if (refresh) page = 1; // reset page on refresh

    final response = await apiProvider.getApi(page: page);

    if (response != null && response['results'] != null) {
      CharacterModel characterModel = CharacterModel.fromJson(response);

      if (refresh) {
        characterList.assignAll(characterModel.results ?? []);
        hasMore.value = true; // reset hasMore
        refreshController.refreshCompleted();
      } else if (loadMore) {
        characterList.addAll(characterModel.results ?? []);
        refreshController.loadComplete();
      } else {
        characterList.assignAll(characterModel.results ?? []);
        characterLoading.value = false;
      }

      // Check if there is a next page
      if (characterModel.info?.next == null) {
        hasMore.value = false;
        refreshController.loadNoData();
      }
    } else {
      characterLoading.value = false;
      Global.customToast(message: "Failed to load characters");
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }
}
