import 'package:flutter/material.dart';
import 'package:marvel_app/controller/character_controller.dart';
import 'package:marvel_app/view/widgets/characters_list_widget.dart';

class HomeScreen  extends StatelessWidget {
  final CharacterController controller = CharacterController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
      ),
      body: SafeArea(child: 
        Expanded(child: 
        CharactersListWidget()
        )
      ),
    );
    
  }
}