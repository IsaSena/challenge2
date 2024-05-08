import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPhotoContainer extends StatelessWidget {
  const UserPhotoContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadiusCircular,
      required this.profileImage,
      required this.focus});

  final double width;
  final double height;
  final double borderRadiusCircular;
  final String profileImage;
  final bool focus;

  @override
  Widget build(BuildContext context) {
    final margin = (focus == true)
        ? const EdgeInsets.symmetric(horizontal: 20)
        : const EdgeInsets.only(bottom: 28);
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(profileImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(borderRadiusCircular),
      ),
    );
  }
}
