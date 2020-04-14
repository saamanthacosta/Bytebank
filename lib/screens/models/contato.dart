class Contato {
  final String nome;

  Contato(this.nome, this.numConta);

  final int numConta;

  @override
  String toString() {
    return 'Contato{nome: $nome, numConta: $numConta}';
  }

}