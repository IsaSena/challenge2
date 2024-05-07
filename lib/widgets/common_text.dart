import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, required this.title, required this.size, this.color});

  final String title;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    //final color = (size == 12) ? Themes.Letras12 : Themes.Letras22;
    if(size == 12){
      final color = Themes.Letras12;
    }else if(size == 22){
      final color = Themes.Letras22;
    }else{
      color;
    }

    return Text(
      title,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: color),
    );
  }
}
