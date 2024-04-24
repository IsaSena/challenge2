import 'package:challenge2/pages/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class Infos { //extender ChangeNotifier? -> criar um void changeFavImage
  String name;
  String email;
  String profileImage;
  String contact;
  bool favorito;

  Infos({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.contact,
    required this.favorito,
  });
}

final List<Infos> profiles = [
  //lista profiles do tipo Infos
  Infos(
    name: 'Isabela',
    email: 'isabela@gmail.com',
    profileImage: 'assets/image/img2.jpg',
    contact: '(62) 99999-9999',
    favorito: true,
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
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
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/img1.jpg'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Column(
                      //space between ou center
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Lorem Ipsum da Silva',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Container(
                          child: Text(
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
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Contatos vinculados',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Expanded(
              //Com container não funciona, pq? Container tem que dar altura?
              child: Container(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
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
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    '${profiles[index].profileImage}'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            //how should i use this in a better way?
                            margin: EdgeInsets.only(left: 40),
                            child: Column(
                              //space between ou center
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    '${profiles[index].name}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(bottom: 10),
                                ),
                                Container(
                                  child: Text(
                                    '${profiles[index].email}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container( //tá funcionando só não aparece ainda
                                  child: IconButton(
                                    icon: SvgPicture.asset('assets/icons/vector.svg'),
                                    iconSize: 15,
                                    onPressed: () {
                                      // favorito = !favorito; //setta o estado no clique
                                      // setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 84),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    // settings: RouteSettings(
                                    //     name: 'page1',
                                    //     arguments: {
                                    //       'name': profiles[index].name,
                                    //       'email': profiles[index].email,
                                    //       'profileImage':
                                    //           profiles[index].profileImage,
                                    //       'contact': profiles[index].contact,
                                    //     }),
                                    builder: (context) => Page2(user: profiles[index],)));
                              },
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(left: 84),
                          //   child: Icon(Icons.arrow_forward_ios),
                          //
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
