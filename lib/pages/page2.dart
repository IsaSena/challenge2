import 'package:challenge2/pages/pages.dart';
import 'package:challenge2/providers.dart';
import 'package:challenge2/widgets/user_photo_container.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:challenge2/data/data.dart';
import 'package:challenge2/widgets/widgets.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

final ButtonStyle style = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 22),
  backgroundColor: Themes.Azul,
);

class Page2 extends StatefulWidget {
  //final Infos user; //Traz todos os parâmetros dentro de user da page 1
  const Page2({required, super.key}); //passa para a página?

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  //criou um construtor pra passar o int
  // late bool favorito;
  // late Infos selectedUser;//boolean de favorito se foi clicado ou não

  _onTapFav(WidgetRef ref, Infos selectedUser) {
    final userUpdated = ref
        .watch(listaUsersProvider.notifier) //Observa mudança no estado
        .update(selectedUser.id); //Dá update no estado
    if (userUpdated != null) {
      ref.read(userSelectedProvider.notifier).state =
          userUpdated.copyWith(); //lê o objeto e notifica
      //Atribui o novo estado
      //É o que faz atualizar na hora na tela
      //Pois o dado foi atualizado na lista, porém não nesse provider
    }
  }

  @override
  void initState() {
    // selectedUser = widget.user;
    // declara um estado inicial para a variável de acordo com o que veio do user
    // favorito = widget.user.favorito;
    // TODO: implement initState
    super.initState();
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: const TextStyle(fontSize: 22),
    backgroundColor: Themes.Azul,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        final selectedUser = ref.watch(userSelectedProvider);
        // final selectedUser = ref.watch(listaUsersProvider)[user];
        //final favorited = ref.read(listaProvider.notifier).state[user] = User();
        return Scaffold(
          body: ColorfulSafeArea(
            color: Themes.Azul,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlueContainer(
                    height: 275,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: IconButton(
                                iconSize: 32,
                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UserPhotoContainer(
                              width: 122,
                              height: 122,
                              borderRadiusCircular: 100,
                              profileImage: selectedUser!.profileImage,
                              focus: false,
                            ),
                            CommonText(
                              title: selectedUser.name,
                              size: 16,
                              color: Colors.white,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: CommonText(
                                title: selectedUser.email,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: const Icon(Icons.delete_outline_sharp),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Remover Usuário'),
                                        content: Text(
                                            'Gostaria de remover o usuário ${selectedUser.name} ?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              final userController = ref.watch(
                                                  listaUsersProvider
                                                      .notifier); //pega o notificador de estado e acessa a lista
                                              userController.delete(selectedUser
                                                  .id); //deleta o usuário pelo id passado -> poderia ser index, mudar no provider
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Page1(),
                                                ),
                                              );
                                            },
                                            child: const Text('Remover'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: const Icon(Icons.share),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                iconSize: 30,
                                onPressed: () {
                                  _onTapFav(ref, selectedUser);
                                  //usar um valueNotifier?
                                  // final selectedUserController =
                                  //     ref.read(userSelectedProvider.notifier);
                                  // selectedUserController.state =
                                  //     selectedUser.copyWith(
                                  //   favorito: !selectedUser.favorito,
                                  // );
                                },
                                icon: SvgPicture.asset(selectedUser.favorito
                                    ? 'assets/icons/yellowVector.svg'
                                    : 'assets/icons/vector.svg'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    //insere um width
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonInfoField(selectedUser: selectedUser),
                          //infos do usuário clicado
                          const CommonText(
                            title: 'Anotações',
                            size: 12,
                          ),
                          const TextFieldBox(),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      //botoes
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Button(
                            width: 367,
                            height: 57,
                            title: 'Enviar mensagem',
                            icon: Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Button(
                          width: 367,
                          height: 57,
                          title: 'Enviar um e-mail',
                          icon: Icon(
                            Icons.chat_bubble,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
