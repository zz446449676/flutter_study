import 'package:flutter/material.dart';

class PlaygroundLayoutItem extends StatelessWidget {
  const PlaygroundLayoutItem({Key? key, required this.textContent}) : super(key: key);

  final String textContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 32.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3.0
        ),
        color: Colors.yellow[200],
      ),
      child: Text(
        textContent,
        style: const TextStyle(
          fontSize: 22.0
        ),
      ),
    );
  }
}
