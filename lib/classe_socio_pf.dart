import 'package:dcli/dcli.dart';

import 'classe_endereco.dart';

class SocioPF {
  String nome;
  String cPF;
  final Endereco endereco;

  SocioPF.novoSocio()
      : nome = ask(
            'Agora precisaremos dos dados do(a) sócio(a)! \nNome do(a) sócio(a):'),
        cPF = ask('CPF:',
            validator: Ask.all([Ask.integer, Ask.lengthRange(11, 11)])),
        endereco = Endereco.novoEndereco();

  @override
  String toString() {
    return '\nNome: $nome \nCPF: $cPF \nEndereço: $endereco';
  }
}
