import 'dart:io';
import 'package:dcli/dcli.dart';
import 'package:dcli_empresas/classe_empresa.dart';
import 'package:dcli_empresas/classe_socio_pf.dart';
import 'package:dcli_empresas/classe_socio_pj.dart';
import 'package:dcli_empresas/strings.dart';

Future<void> main() async {
  var cadastroEmpresas = menu(prompt: Strings.bemVindo, options: [
    (Strings.cadastrarEmpresa),
    (Strings.buscarPorCnpj),
    (Strings.buscarPorCpfOuCnpjDoSocio),
    (Strings.listarEmpresas),
    (Strings.excluirEmpresa),
    (Strings.sair)
  ]);

  if (cadastroEmpresas == Strings.cadastrarEmpresa) {
    var empresa = Empresa.novaEmpresa();
    if (empresa.socio == 'Pessoa Física') {
      var socio = SocioPF.novoSocio();
      var confirmar = confirm('Os dados acima estão corretos?');

      if (confirmar) {
        print('Empresa cadastrada!');
      } else {
        print('Comece o processo novamente!');
        empresa = Empresa.novaEmpresa();
      }

      print(empresa);
      print(socio);

      if (!exists('empresas_cadastradas')) {
        createDir('empresas_cadastradas');
      }

      if (!exists('empresas_cadastradas/empresa.txt')) {
        'empresas_cadastradas/${empresa.cnpj}.txt'
            .append('\n$empresa \n$socio');
      }
    } else if (empresa.socio == 'Pessoa Jurídica') {
      var socio = SocioPJ.novoSocio();
      var confirmar = confirm('Os dados acima estão corretos?');

      if (confirmar) {
        print('Empresa cadastrada!');
      } else {
        print('Comece o processo novamente!');
        empresa = Empresa.novaEmpresa();
      }

      print(empresa);
      print(socio);

      if (!exists('empresas_cadastradas')) {
        createDir('empresas_cadastradas');
      }

      if (!exists('empresas_cadastradas/${empresa.cnpj}.txt')) {
        'empresas_cadastradas/${empresa.cnpj}.txt'.append('\n$empresa $socio');
      }
    }
  } else if (cadastroEmpresas == Strings.buscarPorCnpj) {
    var perguntaCnpj = ask('Qual é o CNPJ da empresa a ser buscada?');
    final File empresaBuscada = File(
        'C:\\Users\\Caio\\Documents\\programming\\proz_dart_flutter\\dcli\\dcli_empresas.dart\\empresas_cadastradas\\$perguntaCnpj.txt');
    try {
      var dadosEmpresaBuscada = await empresaBuscada.readAsString();
      print(dadosEmpresaBuscada);
    } catch (e) {
      print('Não existem empresas cadastradas com o CNPJ informado');
    }
  } else if (cadastroEmpresas == Strings.buscarPorCpfOuCnpjDoSocio) {
    var perguntaCpfOuCnpj = ask('Digite o CPF ou o CNPJ do sócio');
    List<FileSystemEntity> allContents = await Directory(
            "C:\\Users\\Caio\\Documents\\programming\\proz_dart_flutter\\dcli\\dcli_empresas.dart\\empresas_cadastradas\\")
        .list()
        .toList();
  }
}
