import 'package:flutter/material.dart';
import 'package:marvel_app/model/character.dart';
import 'package:marvel_app/utils/styles/app_text_style.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Image.network(character.thumbnail),
          Text(character.name, style: AppTextStyle.textBold24),
          const Padding(padding: EdgeInsets.only(bottom: 16)),
          Text('Description', style: AppTextStyle.textExtralight16),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
          Text(character.description ?? 'N/A')
        ])),
    );
  }
}