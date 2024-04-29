import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge2/pages/infos.dart';

final favorited = StateProvider<bool>((ref) => false);

//final teste = StateProvider((ref) => true); //=> significa o return



//retorno é bool, usar para favorito?
//final nome = StateProvider<String>((ref) => ''); //posso tipar <>
//useProvider and ref.read
//state é o valor da variável
//dispose limpa a memória
//trocar stateless por consumer