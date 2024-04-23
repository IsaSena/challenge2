import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:flutter/widgets.dart';

final ButtonStyle style = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 22),
  backgroundColor: Themes.Azul,
);

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final param = ModalRoute.of(context)?.settings.arguments
        as Map<String, dynamic>; //pode vir nulo mas não virá
    final String name = param['name'];
    final String email = param['email'];
    final String profileImage = param['profileImage'];
    final String contact = param['contact'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 275, //MediaQuery.of(context).size.height * 0.3,
              //color: Themes.Azul,
              decoration: BoxDecoration(
                color: Themes.Azul,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // pq sem aplica em tudo?
                children: [
                  Container(
                    width: 122,
                    height: 122,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('$profileImage'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    margin: EdgeInsets.only(bottom: 28),
                  ),
                  Container(
                    child: Text(
                      '${name}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '${email}',
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                      '${name}',
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
                      '${contact}',
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
                      '${contact}',
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
                      '${email}',
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

                    //ElevatedButton(onPressed: () {}, child: Text('Enviar mensagem'))
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
