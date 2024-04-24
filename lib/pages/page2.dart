import 'package:challenge2/pages/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

final ButtonStyle style = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 22),
  backgroundColor: Themes.Azul,
);

class Page2 extends StatefulWidget {
  final Infos user; //Traz todos os parâmetros dentro de user da page 1
  const Page2({required this.user, super.key}); //passa para a página?

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late bool favorito; //boolean de favorito se foi clicado ou não

  @override
  void initState() { // declara um estado inicial para a variável de acordo com o que veio do user
    favorito = widget.user.favorito;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("FAVORITO ? - $favorito");
    // final param = ModalRoute.of(context)?.settings.arguments
    //     as Map<String, dynamic>; //pode vir nulo mas não virá
    // final String name = param['name'];
    // final String email = param['email'];
    // final String profileImage = param['profileImage'];
    // final String contact = param['contact'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 275, //MediaQuery.of(context).size.height * ?.?,
              //color: Themes.Azul,
              decoration: BoxDecoration(
                color: Themes.Azul,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // pq sem aplica em tudo?
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                          iconSize: 32,
                          icon: Icon(Icons.arrow_back_ios_rounded),
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
                            image: AssetImage('${widget.user.profileImage}'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        margin: EdgeInsets.only(bottom: 28),
                      ),
                      Container(
                        child: Text(
                          '${widget.user.name}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${widget.user.email}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        margin: EdgeInsets.only(top: 12),
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
                          icon: Icon(Icons.delete_outline_sharp),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: SvgPicture.asset(favorito ? 'assets/icons/vector.svg' : 'assets/icons/yellowVector.svg'),
                          iconSize: 30,
                          onPressed: () {
                            favorito = !favorito; //setta o estado no clique
                            setState(() {});

                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 380,
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
                      '${widget.user.name}',
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
                      '${widget.user.contact}',
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
                      '${widget.user.contact}',
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
                      '${widget.user.email}',
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
                      margin: EdgeInsets.only(top: 16),
                      width: double.infinity,
                      height: 191,
                      decoration: BoxDecoration(
                          border: Border.all(color: Themes.Azul, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Digite aqui...',
                          border: InputBorder.none,
                          // Remove a borda do TextField
                          contentPadding:
                              EdgeInsets.all(5), // Ajusta o espaçamento interno
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 367,
                height: 57,
                child: ElevatedButton.icon(
                  style: style,
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Enviar mensagem',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 367,
                height: 57,
                child: ElevatedButton.icon(
                  style: style,
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Enviar um e-mail',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
