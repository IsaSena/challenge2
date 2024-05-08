import 'package:challenge2/data/data.dart';
import 'package:challenge2/widgets/widgets.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:challenge2/theme/theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:challenge2/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _controllerContact = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerName = TextEditingController();

  var telefoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####', //define que no # irá um caractere
    filter: {
      "#": RegExp(r'[0,1,2,3,4,5,6,7,8,9]')
    }, //filtra que no # pode ser de 0 -> 9
  );

  bool isChecked = false;

  final ButtonStyle style = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: const TextStyle(fontSize: 22),
    backgroundColor: Themes.Azul,
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        return Scaffold(
          body: ColorfulSafeArea(
            color: Themes.Azul,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlueContainer(
                    height: MediaQuery.of(context).size.height * 0.128,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                iconSize: 24,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonText(
                                title: 'Cadastrar Usuário',
                                size: 24,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: CommonText(
                        title: 'Informe os dados do usuário', size: 20),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(title: 'Nome completo', size: 16),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            width: MediaQuery.of(context).size.height * 0.428,
                            child: TextFormField(
                              controller: _controllerName,
                              //fica observando o campo de texto
                              //usar on Saved e validator
                              textCapitalization: TextCapitalization.words,
                              // onSaved: (value){
                              // },
                              validator: (value) {
                                return (value == null || value.isEmpty)
                                    ? 'Preencha o campo com o dado solicitado!'
                                    : null;
                              },
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: 'Informe o nome completo',
                                fillColor: Themes.Cinza,
                                filled: true,
                              ),
                            ),
                          ),
                          const CommonText(title: 'Contato', size: 16),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            width: MediaQuery.of(context).size.height * 0.428,
                            child: TextFormField(
                              //usar on Saved e validator
                              keyboardType: TextInputType.number,
                              controller: _controllerContact,
                              //escuta o TextEditingController
                              inputFormatters: [telefoneFormatter],
                              //aplica a formatação
                              onSaved: (String? value) {},
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: 'Informe o contato',
                                fillColor: Themes.Cinza,
                                filled: true,
                              ),
                              validator: (value) {
                                return (value == null ||
                                        value.isEmpty ||
                                        value.length == 14)
                                    ? 'Preencha o campo com o dado solicitado!'
                                    : null;
                              },
                            ),
                          ),
                          const CommonText(title: 'E-mail', size: 16),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01),
                            width: MediaQuery.of(context).size.height * 0.428,
                            child: TextFormField(
                              controller: _controllerEmail,
                              //usar on Saved e validator
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                labelText: 'Informe o email do usuário',
                                fillColor: Themes.Cinza,
                                filled: true,
                              ),
                              validator: (value) {
                                return (value == null || value.isEmpty)
                                    ? 'Preencha o campo com o dado solicitado!'
                                    : null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03),
                            child: Row(
                              children: [
                                Checkbox(
                                  //depois verificar a cor de fundo
                                  checkColor: Colors.black,
                                  //fillColor: ,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(
                                      () {
                                        isChecked = value!;
                                        //print(isChecked);
                                      },
                                    );
                                  },
                                ),
                                const CommonText(title: 'Favorito', size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 55,
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        if (_formKey.currentState!.validate() == true) {
                          final newCad = ref.watch(listaUsersProvider);

                          Infos user = Infos(
                            //cria o objeto de user
                            id: newCad.length + 1,
                            name: _controllerName.text,
                            email: _controllerEmail.text,
                            contact: _controllerContact.text,
                            favorito: isChecked,
                          );

                          newCad.add(user);

                          Navigator.of(context).pop();
                        }
                        _formKey.currentState!.validate();
                      },
                      child: const CommonText(
                        title: 'Confirmar',
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
