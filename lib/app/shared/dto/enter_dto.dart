class EnterDto {
  final String cpf;

  EnterDto({this.cpf});

  Map<String, dynamic>toMap() {
    return {
      "cpf": this.cpf,
    };
  }
}
