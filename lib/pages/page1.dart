//import 'package:challenge2/pages/cadastro.dart';
//import 'package:challenge2/pages/page2.dart';
//import 'package:challenge2/providers.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:challenge2/widgets/user_photo_container.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/widgets/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //print('Oi');
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        //final lista = ref.watch(listaUsersProvider); //variável que irá ficar de olho na referência dentro do provider
        //quando o valor troca, rebuilda o widget
        return Scaffold(
          body: ColorfulSafeArea(
            color: Themes.Azul,
            child: Column(
              children: [
                BlueContainer(
                  height: 130,
                  child: Row(
                    //alinhar a foto
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const UserPhotoContainer(
                        width: 56,
                        height: 56,
                        borderRadiusCircular: 50,
                        profileImage: 'assets/image/img1.jpg',
                        focus: true,
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
                              child: const CommonText(
                                title: 'Lorem Ipsum da Silva',
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            const CommonText(
                                title: 'LoremIpsum@loremIpsum.com.br',
                                size: 12,
                                color: Colors.white),
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
                      child: const CommonText(
                        title: "Contatos Vinculados",
                        size: 22,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  //expande ao máximo
                  child: SizedBox(
                    width: double.infinity,
                    child: DisplayListOfUsers(),
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
              //seila(context);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

//Future<void> seila(BuildContext context) async {
// Navigator.push returns a Future that completes after calling
// Navigator.pop on the Selection Screen.
//final result = await Navigator.push(
//context,
// Create the SelectionScreen in the next step.
//MaterialPageRoute(builder: (context) => const Cadastro()),
//);
// print('entrei');
//setState(() {
//lista.add(result as Infos);
//});
//profiles.add(result);
// for (var i = 0; i < profiles.length; i++) {
//   print(profiles[i].name);
// }
//teste
//print(profiles.;
//}
}
