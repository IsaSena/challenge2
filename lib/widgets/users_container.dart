//import 'package:challenge2/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

//container de informações page1

class UsersContainer extends ConsumerWidget {
  const UsersContainer(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userFavorited});

  final String userName;
  final String userEmail;
  final bool userFavorited;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.only(left: 40),
      child: Column(
        //space between ou center
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              userName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            userEmail,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          userFavorited
              ? Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset('assets/icons/yellowVector.svg'),
                )
              : Container(),
        ],
      ),
    );
  }
}
