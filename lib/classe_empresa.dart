import 'package:dcli/dcli.dart';
import 'package:dcli_empresas/strings.dart';
import 'package:uuid/uuid.dart';

import 'classe_endereco.dart';

class Empresa {
  String id;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  final Endereco endereco;
  String telefone;
  DateTime horarioCadastro;
  String socio;

  Empresa.novaEmpresa()
      : horarioCadastro = DateTime.now(),
        id = Uuid().v1(),
        razaoSocial = ask(Strings.novaRazaoSocial),
        nomeFantasia = ask(Strings.novoNomeFantasia),
        cnpj = ask(Strings.novoCnpj),
        endereco = Endereco.novoEndereco(),
        telefone = ask(Strings.novoTelefone),
        socio = menu(
            prompt: Strings.pfOuPj,
            options: ['Pessoa Física', 'Pessoa Jurídica']);

  @override
  String toString() {
    return 'Id: $id -- Horário do Cadastro: $horarioCadastro \nRazão Social: $razaoSocial \nNome Fantasia: $nomeFantasia \nCNPJ: $cnpj \nEndereço: $endereco \nTelefone: $telefone  \nSócio: $socio';
  }
}
