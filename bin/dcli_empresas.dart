import 'package:dcli/dcli.dart';
import 'package:dcli_empresas/classe_empresa.dart';
import 'package:dcli_empresas/strings.dart';

Future<void> main() async {
  List<Empresa> empresas = [];

  while (true) {
    var cadastroEmpresas = menu(prompt: Strings.bemVindo, options: [
      (Strings.cadastrarEmpresa),
      (Strings.buscarPorCnpj),
      (Strings.buscarPorCpf),
      (Strings.listarEmpresas),
      (Strings.excluirEmpresa),
      (Strings.sair)
    ]);

    if (cadastroEmpresas == Strings.cadastrarEmpresa) {
      var empresa = Empresa.novaEmpresa();
      print(empresa);
      var confirmar = confirm('Os dados acima estão corretos?');

      if (confirmar) {
        print('Empresa cadastrada!');
        empresas.add(empresa);
      } else {
        print('Comece o processo novamente!');
        empresa = Empresa.novaEmpresa();
      }
    } else if (cadastroEmpresas == Strings.buscarPorCnpj) {
      var perguntaCnpj = ask('Qual é o CNPJ da empresa a ser buscada?');

      print(empresas.where((item) => perguntaCnpj.contains(item.cnpj)));
    } else if (cadastroEmpresas == Strings.buscarPorCpf) {
      var perguntaCpf = ask('Digite o CPF ou o CNPJ do sócio');

      print(empresas.where((item) => perguntaCpf.contains(item.socio.cPF)));
    } else if (cadastroEmpresas == Strings.listarEmpresas) {
      empresas.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
      print(empresas);
    } else if (cadastroEmpresas == Strings.excluirEmpresa) {
      var perguntaId = ask('Qual é o Id da empresa que deseja remover?');

      empresas.removeWhere((element) => element.id == perguntaId);
    } else if (cadastroEmpresas == Strings.sair) {
      break;
    }
  }
}
