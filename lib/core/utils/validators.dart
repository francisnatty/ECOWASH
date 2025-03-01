class EmailValidator {
  static bool validEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  }
  const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
  final regExp = RegExp(emailPattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? urlValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'URL cannot be empty';
  }

  const urlPattern = r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$';
  final regExp = RegExp(urlPattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid URL';
  }
  return null;
}

String? notEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field cannot be empty';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }

  return null;
}

String? phoneNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Number field cannot be empty';
  }
  if (value.length != 11) {
    return 'Incomplete number';
  }

  return null;
}

String? ninMumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Number field cannot be empty';
  }
  if (value.length != 11) {
    return 'Nin number must be 11 digits';
  }

  return null;
}

String? websiteValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Website cannot be empty';
  }
  const websitePattern = r'^(https?:\/\/)?([\w\d\-]+\.)+[\w]{2,}(\/.+)*\/?$';
  final regExp = RegExp(websitePattern);

  if (!regExp.hasMatch(value)) {
    return 'Enter a valid website URL';
  }
  return null;
}
