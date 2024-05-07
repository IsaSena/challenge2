import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({super.key});

  //box de anotações

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: double.infinity,
      height: 191,
      decoration: BoxDecoration(
        border: Border.all(color: Themes.Azul, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Digite aqui...',
          border: InputBorder.none,
          // Remove a borda do TextField
          contentPadding: EdgeInsets.all(
              5), // Ajusta o espaçamento interno
        ),
      ),
    );
  }
}
