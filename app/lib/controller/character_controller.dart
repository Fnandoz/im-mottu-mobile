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
    fetchCharactersData(null);
  }

  void fetchCharactersData(String? nameStartsWith) async {
    List<Character> characterList = [];
    try {
      if (nameStartsWith == null || nameStartsWith.isEmpty) {
        characterList = await apiServices.fetchCharacters();
        characters.assignAll(characterList);
      } else {
        characterList = await apiServices.fetchCharactersNameStartsWith(nameStartsWith);
        characters.assignAll(characterList);
      }
    } catch (e) {
      print('Failed to load characters $e');
    }
  }
}