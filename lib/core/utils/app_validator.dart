import 'input_patterns.dart';

abstract final class AppValidator {
  AppValidator._();

  static String? requiredField(
    String? value, {
    String fieldName = 'This field',
  })
  {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? email(String? value) {
    final required = requiredField(value, fieldName: 'Email');

    if (required != null) {
      return required;
    }

    if (!InputPatterns.email.hasMatch(value!.trim())) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? phone(String? value) {
    final required = requiredField(value, fieldName: 'Phone number');

    if (required != null) {
      return required;
    }

    if (!InputPatterns.phone.hasMatch(value!.trim())) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  static String? password(String? value) {
    final required = requiredField(value, fieldName: 'Password');

    if (required != null) {
      return required;
    }

    if (value!.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!InputPatterns.uppercase.hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }

    if (!InputPatterns.lowercase.hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }

    if (!InputPatterns.number.hasMatch(value)) {
      return 'Password must contain a number';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final required = requiredField(value, fieldName: 'Confirm password');

    if (required != null) {
      return required;
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? name(String? value) {
    final required = requiredField(value, fieldName: 'Name');

    if (required != null) {
      return required;
    }

    if (!InputPatterns.onlyLetters.hasMatch(value!.trim())) {
      return 'Please enter a valid name';
    }

    return null;
  }
}
