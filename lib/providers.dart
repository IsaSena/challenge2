import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/pages/infos.dart';


final listaProvider = StateProvider<List<Infos>>((ref) =>
[Infos(
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
]);



//final teste = StateProvider((ref) => true); //=> significa o return



//retorno é bool, usar para favorito?
//final nome = StateProvider<String>((ref) => ''); //posso tipar <>
//useProvider and ref.read
//state é o valor da variável
//dispose limpa a memória
//trocar stateless por consumer