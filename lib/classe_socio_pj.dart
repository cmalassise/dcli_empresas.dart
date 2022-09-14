import 'package:dcli/dcli.dart';

import 'classe_endereco.dart';

class SocioPJ {
  String razaoSocial;
  String nomeFantasia;
  String cNPJ;
  final Endereco endereco;

  SocioPJ.novoSocio()
      : razaoSocial = ask('Razão Social:'),
        nomeFantasia = ask('Nome Fantasia'),
        cNPJ = ask('CNPJ:'),
        endereco = Endereco.novoEndereco();

  @override
  String toString() {
    return 'Razão Social: $razaoSocial \nNome Fantasia: $nomeFantasia \nCNPJ: $cNPJ \nEndereço: $endereco';
  }
}
