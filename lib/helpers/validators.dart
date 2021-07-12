class Validators {
  static String? validateEmail(String? value) {
    return value!.isEmpty ? 'Email can\'t be empty' : null;
  }

  static String? validatePassword(String? value) {
    return value!.isEmpty ? 'Password can\'t be empty' : null;
  }
}
