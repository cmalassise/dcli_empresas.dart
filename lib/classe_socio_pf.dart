import 'package:dcli/dcli.dart';

import 'classe_endereco.dart';

class SocioPF {
  String nome;
  String cpf;
  final Endereco endereco;

  SocioPF.novoSocio()
      : nome = ask(
            'Agora precisaremos dos dados do(a) sócio(a)! \nNome do(a) sócio(a):'),
        cpf = ask('CPF:',
            validator: Ask.all([Ask.integer, Ask.lengthRange(11, 11)])),
        endereco = Endereco.novoEndereco();

  @override
  String toString() {
    return '\nNome: $nome \nCPF: ${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)} \nEndereço: $endereco';
  }
}
