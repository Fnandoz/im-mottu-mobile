import 'package:flutter/material.dart';


class CharacterCardWidget extends StatelessWidget {
  final String model;
  final void Function(String) onTapCallback;

  const CharacterCardWidget({super.key, required this.model, required this.onTapCallback});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => { onTapCallback(model) },
        child: SizedBox(
          width: 150,
          height: 200,
          child: Stack(
            children: [
              Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                fit: BoxFit.fill,
              ),
              const Center(
                  child: Column(children: [
                Spacer(),
                Text(
                  'Hero Name',
                ),
                Padding(padding: EdgeInsets.only(bottom: 16))
              ]))
            ],
          ),
        ));
  }
}
