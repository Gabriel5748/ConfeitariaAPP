abstract class ValidatePassword {
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

    return errorsList.isNotEmpty ? errorsList.join('\n') : null;
  }

  static confirmPassword(String password1, String password2) {
    if (password1 != password2) {
      return 'Senhas não conferem. Tente novamente';
    }

    return null;
  }
}

abstract class ValidateEmail {
  static validate(String email) {
    final List<String> errorsList = [];
    String error = '';

    if (email.isEmpty) {
      error = 'Informe um email';
      errorsList.add(error);
    }

    if (!email.contains('@')) {
      error = 'Informe um email válido';
      errorsList.add(error);
    }

    if (email.length <= 5) {
      error = 'O email deve contar mais que 5 caracteres';
      errorsList.add(error);
    }

    return errorsList.isNotEmpty ? errorsList.join('\n') : null;
  }
}
