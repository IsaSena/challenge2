import 'package:challenge2/pages/cadastro.dart';
import 'package:challenge2/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:challenge2/pages/infos.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

// class Infos {
//   //extender ChangeNotifier? -> criar um void changeFavImage
//   String name;
//   String email;
//   String profileImage;
//   String contact;
//   bool favorito;
//
//   Infos({
//     required this.name,
//     required this.email,
//     this.profileImage = 'assets/image/img2.jpg' ,
//     required this.contact,
//     required this.favorito,
//   });
// }

final List<Infos> profiles = [
  //lista profiles do tipo Infos
  Infos(
    name: 'Isabela',
    email: 'isabela@gmail.com',
    profileImage: 'assets/image/img2.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Vinicius',
    email: 'vinicius@gmail.com',
    profileImage: 'assets/image/img3.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Regina',
    email: 'regina@gmail.com',
    profileImage: 'assets/image/img4.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Guilherme',
    email: 'guilherme@gmail.com',
    profileImage: 'assets/image/img5.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Lucas',
    email: 'lucas@gmail.com',
    profileImage: 'assets/image/img6.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Havila',
    email: 'havila@gmail.com',
    profileImage: 'assets/image/img7.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Fernando',
    email: 'fernando@gmail.com',
    profileImage: 'assets/image/img8.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    name: 'Natalia',
    email: 'natalia@gmail.com',
    profileImage: 'assets/image/img9.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
];

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    //print('Oi');
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
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Container(
                          child: const Text(
                            'LoremIpsum@loremIpsum.com.br',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: const Text(
                    'Contatos vinculados',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => Page2(
                              user: profiles[index],
                            ),
                          ),
                        )
                            .then(
                              (value) {
                            //executa apos o pop ocorrer
                            if (profiles[index].favorito == true) {
                              setState(
                                    () {
                                  profiles[index].favorito == true;
                                },
                              );
                              //print(profiles[index].favorito);
                            }
                            //print('aaaaaa');
                          },
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
                                  image: AssetImage(profiles[index].profileImage),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                //how should i use this in a better way?
                                margin: const EdgeInsets.only(left: 40),
                                child: Column(
                                  //space between ou center
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        profiles[index].name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        profiles[index].email,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    profiles[index].favorito
                                        ? Container(
                                          margin: const EdgeInsets.only(top: 6),
                                            child: SvgPicture.asset(
                                                'assets/icons/yellowVector.svg')
                                            // child: IconButton(
                                            //   icon: SvgPicture.asset(
                                            //       profiles[index].favorito
                                            //           ? 'assets/icons/yellowVector.svg'
                                            //           : 'assets/icons/vector.svg'),
                                            //   iconSize: 15,
                                            //   onPressed: null, //tira o onPressed
                                            // ),
                                            )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.only(left: 10),
                            //   child: IconButton(
                            //     icon: const Icon(Icons.arrow_forward_ios),
                            //     onPressed: () {
                            //       Navigator.of(context)
                            //           .push(
                            //         MaterialPageRoute(
                            //           // settings: RouteSettings(
                            //           //     name: 'page1',
                            //           //     arguments: {
                            //           //       'name': profiles[index].name,
                            //           //       'email': profiles[index].email,
                            //           //       'profileImage':
                            //           //           profiles[index].profileImage,
                            //           //       'contact': profiles[index].contact,
                            //           //     }),
                            //           builder: (context) => Page2(
                            //             user: profiles[index],
                            //           ),
                            //         ),
                            //       )
                            //           .then(
                            //         (value) {
                            //           //executa apos o pop ocorrer
                            //           if (profiles[index].favorito == true) {
                            //             setState(
                            //               () {
                            //                 profiles[index].favorito == true;
                            //               },
                            //             );
                            //             //print(profiles[index].favorito);
                            //           }
                            //           //print('aaaaaa');
                            //         },
                            //       );
                            //       //print('alo');
                            //     },
                            //   ),
                            // ),
                              const IconButton(icon: Icon(Icons.arrow_forward_ios_rounded),
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
            // FloatingActionButton(
            //     child: Icon(Icons.add),
            //     onPressed: (){})
          ],
        ),
      ),
      floatingActionButton : FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
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
      profiles.add(result as Infos);
    });
    //profiles.add(result);
    // for (var i = 0; i < profiles.length; i++) {
    //   print(profiles[i].name);
    // }
    //print(profiles.;
  }
}
