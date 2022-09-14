import 'package:dcli/dcli.dart';

class Endereco {
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cEP;

  Endereco.novoEndereco()
      : logradouro = ask('Digite a rua:'),
        numero = ask('Digite o número'),
        complemento = ask('Complemento:'),
        cidade = ask('Cidade:'),
        bairro = ask('Bairro'),
        estado = ask('Estado'),
        cEP = ask('CEP');

  @override
  String toString() {
    return '$logradouro, $numero, $complemento, $bairro, $cidade, $estado, $cEP';
  }
}
