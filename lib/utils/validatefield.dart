class ValidateField {
  static String? validateString(String? v) {
    if (v == null || v == "") {
      return "Please fill data";
    }
    return null;
  }

  static String? validateYear(String? v) {
    if (v == null || v == "") {
      return "Please fill data";
    }
    if (int.tryParse(v) == null) {
      return "invalid number";
    }

    return null;
  }
}
