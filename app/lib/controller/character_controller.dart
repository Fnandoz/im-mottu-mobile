import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:marvel_app/api/http_client.dart';
import 'package:marvel_app/model/character.dart';

class CharacterController extends GetxController {

  final HttpClient apiServices = HttpClient();
  final characters = <Character>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchCharactersData();
  }

  void fetchCharactersData() async {
    try {
      final characterList = await apiServices.fetchCharacters();
      characters.assignAll(characterList);
    } catch (e) {
      print('Failed to load characters $e');
    }
  }
}