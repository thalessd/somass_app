import 'package:cpf_cnpj_validator/cpf_validator.dart';

class InputValidator {
  static final String _textRequired = "Este campo é obrigatório!";
  static final String _textEmail = "Este campo precisa ser um email";
  static final String _textCPF = "Este campo precisa ter um CPF válido";

  static final RegExp _regExpEmail = new RegExp(
     r"^[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?$",
    caseSensitive: false,
    multiLine: false,
  );

  static String isRequired(String value) {
    if (value.isEmpty) {
      return _textRequired;
    }
    return null;
  }

  static String isEmailRequired(String value) {
    if (value.isEmpty) {
      return _textRequired;
    }

    if (!_regExpEmail.hasMatch(value)) {
      return _textEmail;
    }

    return null;
  }

  static String isCPFRequired(String value) {
    if (value.isEmpty) {
      return _textRequired;
    }

    if (!CPFValidator.isValid(value)) {
      return _textCPF;
    }

    return null;
  }
}
