import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.icon,
      required this.title,
      required this.width,
      required this.height});

  final Icon icon;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 22),
      backgroundColor: Themes.Azul,
    );
    return SizedBox(
      width: width, //se necessário colocar como relativo
      height: height,
      child: ElevatedButton.icon(
        style: style,
        onPressed: () {},
        icon: icon, //aplicar cor
        label: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        // label: const Text(
        //   text,
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}
