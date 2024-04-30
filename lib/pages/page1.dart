import 'package:challenge2/pages/cadastro.dart';
import 'package:challenge2/pages/page2.dart';
import 'package:challenge2/providers.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:challenge2/pages/infos.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //print('Oi');
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      final lista = ref.watch(
          listaUsersProvider); //variável que irá ficar de olho na referência dentro do provider
      //quando o valor troca, rebuilda o widget
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Themes.Azul,
                ),
                height: 130,
                width: double.infinity,
                //color: Colors.blue,
                child: Row(
                  //alinhar a foto
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      //margin: EdgeInsets.only(left: 22, top: 40, bottom: 28),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/image/img1.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: Column(
                        //space between ou center
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'Lorem Ipsum da Silva',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const Text(
                            'LoremIpsum@loremIpsum.com.br',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text(
                      'Contatos vinculados',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Expanded(
                //expande ao máximo
                child: SizedBox(
                  //height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => Page2(
                                user: index,
                              ),
                            ),
                          );
                          //     .then(
                          //   (value) {
                          //     //executa apos o pop ocorrer
                          //     if (lista[index].favorito == true) {
                          //       setState(
                          //         () {
                          //           lista[index].favorito == true;
                          //         },
                          //       );
                          //       //print(profiles[index].favorito);
                          //     }
                          //     //print('aaaaaa');
                          //   },
                          // );
                          //final userController = ref.read(listaUsersProvider.notifier);
                          // userController.
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage(lista[index].profileImage),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  //how should i use this in a better way?
                                  margin: const EdgeInsets.only(left: 40),
                                  child: Column(
                                    //space between ou center
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          lista[index].name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        lista[index].email,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      lista[index].favorito
                                          ? Container(
                                              margin:
                                                  const EdgeInsets.only(top: 6),
                                              child: SvgPicture.asset(
                                                  'assets/icons/yellowVector.svg'),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              //Navigator.of(context).pushNamed('/cadastro').then((value) =>{
              //   // print()
              //   //profiles.add()
              // });
              // setState(() {
              //
              // });
              seila(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }

  Future<void> seila(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const Cadastro()),
    );
    // print('entrei');
    setState(() {
      //lista.add(result as Infos);
    });
    //profiles.add(result);
    // for (var i = 0; i < profiles.length; i++) {
    //   print(profiles[i].name);
    // }
    //teste
    //print(profiles.;
  }
}
