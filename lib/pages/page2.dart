import 'package:challenge2/pages/page1.dart';
import 'package:challenge2/providers.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:challenge2/pages/infos.dart';

final ButtonStyle style = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 22),
  backgroundColor: Themes.Azul,
);

class Page2 extends StatefulWidget {
  final int user; //Traz todos os parâmetros dentro de user da page 1
  const Page2({required this.user, super.key}); //passa para a página?

  @override
  State<Page2> createState() => _Page2State(user);
}

class _Page2State extends State<Page2> { //criou um construtor pra passar o int
  // late bool favorito;
  final int user;
  _Page2State(this.user);//boolean de favorito se foi clicado ou não

  @override
  void initState() {
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
        final selectedUser = ref.watch(listaUsersProvider)[user];
        //final favorited = ref.read(listaProvider.notifier).state[user] = User();
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 275,
                    decoration: BoxDecoration(
                      color: Themes.Azul,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
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
                            Container(
                              width: 122,
                              height: 122,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(selectedUser.profileImage),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(500),
                              ),
                              margin: const EdgeInsets.only(bottom: 28),
                            ),
                            Container(
                              child: Text(
                                selectedUser.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text(
                                selectedUser.email,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: const Icon(Icons.delete_outline_sharp),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Remover Usuário'),
                                        content: Text('Gostaria de remover o usuário ${selectedUser.name} ?'),
                                        actions: [
                                          TextButton(onPressed: () {
                                            Navigator.of(context).pop();
                                          }, child: Text('Cancelar'),),
                                          TextButton(onPressed: () {
                                            final userController = ref.read(listaUsersProvider.notifier); //pega o notificador de estado e acessa a lista
                                            userController.delete(user); //deleta o usuário pelo index passado -> poderia ser id, mudar no provider
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Page1(),),);
                                          }, child: Text('Remover'),),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: IconButton(
                                iconSize: 30,
                                color: Colors.white,
                                icon: const Icon(Icons.share),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              child: IconButton(
                                icon: SvgPicture.asset(selectedUser.favorito
                                    ? 'assets/icons/yellowVector.svg'
                                    : 'assets/icons/vector.svg'),
                                iconSize: 30,
                                onPressed: () {
                                  selectedUser.favorito = !selectedUser.favorito; //setta o estado no clique
                                  //print(favorito);
                                  //setState(() {
                                    //widget.user.favorito = favorito;
                                    //print(widget.user.favorito);
                                  //});
                                },
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
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome completo',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras12),
                          ),
                          Text(
                            selectedUser.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras22),
                          ),
                          Text(
                            'Contato',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras12),
                          ),
                          Text(
                            selectedUser.contact,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras22),
                          ),
                          Text(
                            'Contato reserva',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras12),
                          ),
                          Text(
                            selectedUser.contact,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras22),
                          ),
                          // dá pra fazer um if e inserir não informado
                          Text(
                            'E-mail reserva',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras12),
                          ),
                          Text(
                            selectedUser.email,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras22),
                          ),
                          Text(
                            'Anotações',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Themes.Letras12),
                          ),
                          Container(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 367,
                          height: 57,
                          child: ElevatedButton.icon(
                            style: style,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Enviar mensagem',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 367,
                          height: 57,
                          child: ElevatedButton.icon(
                            style: style,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chat_bubble,
                              color: Colors.white,
                            ),
                            label: const Text(
                              'Enviar um e-mail',
                              style: TextStyle(color: Colors.white),
                            ),
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
      }
    );
  }
}
