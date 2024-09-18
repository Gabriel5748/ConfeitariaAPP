class ValidatePassword {
  static validate(String password) {
    final List<String> errorsList = [];
    late String error;
    RegExp regex = RegExp(r'[!@&]');

    if (password.isEmpty) {
      error = 'Informe um valor';
      errorsList.add(error);
    }

    if (password.length <= 5) {
      error = 'Informe uma senha de no mínimo 5 caracteres';
      errorsList.add(error);
    }

    if (!regex.hasMatch(password)) {
      error = 'Informe um símbolo especial';
      errorsList.add(error);
    }

    return errorsList;
  }
}
