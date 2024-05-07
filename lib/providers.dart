import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/pages/infos.dart';

final listaInicial = [Infos(
  id: 1,
  name: 'Isabela',
  email: 'isabela@gmail.com',
  profileImage: 'assets/image/img2.jpg',
  contact: '(62) 99999-9999',
  favorito: true,
),
  Infos(
    id: 2,
    name: 'Vinicius',
    email: 'vinicius@gmail.com',
    profileImage: 'assets/image/img3.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 3,
    name: 'Regina',
    email: 'regina@gmail.com',
    profileImage: 'assets/image/img4.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 4,
    name: 'Guilherme',
    email: 'guilherme@gmail.com',
    profileImage: 'assets/image/img5.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 5,
    name: 'Lucas',
    email: 'lucas@gmail.com',
    profileImage: 'assets/image/img6.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 6,
    name: 'Havila',
    email: 'havila@gmail.com',
    profileImage: 'assets/image/img7.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 7,
    name: 'Fernando',
    email: 'fernando@gmail.com',
    profileImage: 'assets/image/img8.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
  Infos(
    id: 8,
    name: 'Natalia',
    email: 'natalia@gmail.com',
    profileImage: 'assets/image/img9.jpg',
    contact: '(62) 99999-9999',
    favorito: false,
  ),
];


// final listaProvider = StateProvider<List<Infos>>((ref) =>
// [Infos(
//   name: 'Isabela',
//   email: 'isabela@gmail.com',
//   profileImage: 'assets/image/img2.jpg',
//   contact: '(62) 99999-9999',
//   favorito: true,
// ),
//   Infos(
//     name: 'Vinicius',
//     email: 'vinicius@gmail.com',
//     profileImage: 'assets/image/img3.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Regina',
//     email: 'regina@gmail.com',
//     profileImage: 'assets/image/img4.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Guilherme',
//     email: 'guilherme@gmail.com',
//     profileImage: 'assets/image/img5.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Lucas',
//     email: 'lucas@gmail.com',
//     profileImage: 'assets/image/img6.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Havila',
//     email: 'havila@gmail.com',
//     profileImage: 'assets/image/img7.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Fernando',
//     email: 'fernando@gmail.com',
//     profileImage: 'assets/image/img8.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
//   Infos(
//     name: 'Natalia',
//     email: 'natalia@gmail.com',
//     profileImage: 'assets/image/img9.jpg',
//     contact: '(62) 99999-9999',
//     favorito: false,
//   ),
// ]);

// final newUser = state;
// newUser.add(user);
// state = aux;

final listaUsersProvider = StateNotifierProvider<UserController, List<Infos>>(
        (ref) => UserController());

class UserController extends StateNotifier<List<Infos>> {
  UserController() : super(listaInicial);

  addUser(Infos user) {
    final newUser = state; //cria uma cópia do estado
    newUser.add(user); //adiciona um novo user no novo estado
    state = newUser; // o estado original é substituído pela nova lista
  }

  update() {
    //para atualizar o coração?
    // pega pelo index e troca o state
  }

  delete(int id) {
    if (id > 0 && id <= listaInicial.length){
      state = List<Infos>.from(state)..remove(id);
      //cria uma cópia do estado para não mexer diretamente na lista
      //e deleta pelo índice
    }
  }
}


final userSelectedProvider = StateProvider<Infos?>((ref) {

});