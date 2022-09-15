import 'package:dcli/dcli.dart';

class Endereco {
  String logradouro;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;

  Endereco.novoEndereco()
      : logradouro = ask('Digite a rua:'),
        numero = ask('Digite o número:'),
        complemento = ask(
          'Complemento:',
          required: false,
        ),
        cidade = ask('Cidade:'),
        bairro = ask('Bairro:'),
        estado = ask('Estado:'),
        cep = ask('CEP:', validator: Ask.integer);

  @override
  String toString() {
    return '$logradouro, $numero, $complemento, $bairro, $cidade, $estado, $cep';
  }
}
