abstract final class InputPatterns {
  InputPatterns._();

  static final RegExp email = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  static final RegExp phone = RegExp(r'^(010|011|012|015)\d{8}$');

  static final RegExp uppercase = RegExp(r'[A-Z]');

  static final RegExp lowercase = RegExp(r'[a-z]');

  static final RegExp number = RegExp(r'[0-9]');

  static final RegExp specialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static final RegExp whitespace = RegExp(r'\s');

  static final RegExp onlyLetters = RegExp(r'^[a-zA-Z\s]+$');
}
