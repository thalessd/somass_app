class BadRequestException implements Exception {
  @override
  String toString() {
    return "Não foi possivel concluir a requisição";
  }
}
