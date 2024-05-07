import 'package:challenge2/providers.dart';
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
          onTap: () {
            final userSelectedController =
                ref.read(userSelectedProvider.notifier);
            userSelectedController.state = lista[index];

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Page2(
                  user: lista[index],
                ),
              ),
            );
          },
          child: SizedBox(
            height: 130,
            width: double.infinity,
            child: Row(
              //alinhar a foto
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(lista[index].profileImage),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
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
