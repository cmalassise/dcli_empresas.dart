import 'package:dcli/dcli.dart';

import 'classe_endereco.dart';

class SocioPF {
  String nome;
  String cPF;
  final Endereco endereco;

  SocioPF.novoSocio()
      : nome = ask('Nome do sócio:'),
        cPF = ask('CPF do sócio'),
        endereco = Endereco.novoEndereco();

  @override
  String toString() {
    return 'Nome: $nome \nCPF: $cPF \nEndereço: $endereco';
  }
}
