class InputValidator {
  static final String _textRequired = "Este campo é obrigatório!";
  static final String _textEmail = "Este campo precisa ser um email";

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
}
