import 'package:challenge2/providers.dart';
import 'package:challenge2/widgets/user_photo_container.dart';
import 'package:challenge2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/pages/page2.dart';

class DisplayListOfUsers extends ConsumerWidget {
  const DisplayListOfUsers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lista = ref.watch(listaUsersProvider);
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          //Poderia ser InkWell
          onTap: () {
            final userSelectedController =
                ref.watch(userSelectedProvider.notifier);
            userSelectedController.state = lista[index];

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Page2(
                    //user: lista[index],
                    ),
              ),
            );
          },
          child: Container(
            //SizedBox não aceita o clique em toda a área
            height: 130,
            width: double.infinity,
            child: Row(
              //alinhar a foto
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserPhotoContainer(
                    width: 56,
                    height: 56,
                    borderRadiusCircular: 50,
                    profileImage: lista[index].profileImage,
                    focus: true,),
                Expanded(
                  child: UsersContainer(
                      userName: lista[index].name,
                      userEmail: lista[index].email,
                      userFavorited: lista[index].favorito),
                ),
                const IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
