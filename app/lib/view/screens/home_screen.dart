import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/controller/character_controller.dart';
import 'package:marvel_app/view/widgets/characters_list_widget.dart';

class HomeScreen extends StatelessWidget {
  final CharacterController controller = CharacterController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200]),
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration.collapsed(
                            hintText: 'Search character'),
                        onChanged: (value) {
                          Get.find<CharacterController>().fetchCharactersData(value);
                        },
                      ))
                    ],
                  )),
            )),
      ),
      body: SafeArea(
          child: Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CharactersListWidget()))),
    );
  }
}
