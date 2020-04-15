class Contato {
  final int id;
  final String nome;
  final int numConta;

  Contato(
      this.id,
      this.nome,
      this.numConta);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numConta: $numConta}';
  }

}