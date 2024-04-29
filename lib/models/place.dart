class Place {
  String id;
  List<String> paises;
  String titulo;
  String imagemUrl;
  List<String> recomendacoes;
  double avaliacao;
  double custoMedio;

  Place({
    required this.id,
    required this.paises,
    required this.titulo,
    required this.imagemUrl,
    required this.recomendacoes,
    required this.avaliacao,
    required this.custoMedio,
  });

  Place.copy(Place originalPlace)
      : id = originalPlace.id,
        paises = List.from(originalPlace.paises),
        titulo = originalPlace.titulo,
        imagemUrl = originalPlace.imagemUrl,
        recomendacoes = List.from(originalPlace.recomendacoes),
        avaliacao = originalPlace.avaliacao,
        custoMedio = originalPlace.custoMedio;

  void setTitulo(String titulo) {
    this.titulo = titulo;
  }        
}
