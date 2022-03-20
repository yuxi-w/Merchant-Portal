class EmailFieldValidator {
  static String? validate(String? value) {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)) {
      return "Enter Correct Email";
    } else {
      return null;
    }
  }
}

class EmptyFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty || RegExp(r'^\s*$').hasMatch(value)) {
      return "Field can't be empty";
    } else {
      return null;
    }
  }
}

class LengthValidator {
  static String? validate(String? value) {
    if (value!.length < 70 || RegExp(r'^\s*$').hasMatch(value)) {
      return "Please write at least 70 characters";
    } else {
      return null;
    }
  }
}

class NameFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return "Please enter a valid name";
    } else {
      return null;
    }
  }
}

class PhoneFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
            .hasMatch(value)) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }
}

class ZipcodeFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^([A-Za-z]\d[A-Za-z][-]?\d[A-Za-z]\d)').hasMatch(value)) {
      return "Please enter a valid zip code";
    } else {
      return null;
    }
  }
}
