import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_app/controller/character_controller.dart';
import 'package:marvel_app/view/screens/character_details_screen.dart';

class CharactersListWidget extends StatelessWidget {
  CharacterController controller = Get.put(CharacterController());
  CharactersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.characters.isEmpty) {
        return const Center(
          child: CircularProgressIndicator()
        );
      } else {
        return ListView.separated(itemBuilder: (context, index) {
          final character = controller.characters[index];
          return ListTile(
            leading: Image.network(character.thumbnail),
            title: Text(character.name),
            onTap: () {
              Get.to(CharacterDetailsScreen(character: character));
            },
          );
        }, 
        itemCount: controller.characters.length,
        separatorBuilder: (context, index) => const Divider());
      }
    });
  }
}