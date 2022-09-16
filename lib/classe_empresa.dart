import 'package:dcli/dcli.dart';
import 'package:dcli_empresas/classe_socio_pf.dart';
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
  SocioPF socio;

  Empresa.novaEmpresa()
      : horarioCadastro = DateTime.now(),
        id = Uuid().v1(),
        razaoSocial = ask(Strings.novaRazaoSocial),
        nomeFantasia = ask(Strings.novoNomeFantasia),
        cnpj = ask(Strings.novoCnpj,
            validator: Ask.all([Ask.integer, Ask.lengthRange(14, 14)])),
        endereco = Endereco.novoEndereco(),
        telefone = ask(Strings.novoTelefone, validator: Ask.integer),
        socio = SocioPF.novoSocio();

  @override
  String toString() {
    return '\nId: $id -- Horário do Cadastro: $horarioCadastro \nRazão Social: $razaoSocial \nNome Fantasia: $nomeFantasia \nCNPJ: ${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)} \nEndereço: $endereco \nTelefone: $telefone \nDados do(a) Sócio(a6): $socio';
  }
}
