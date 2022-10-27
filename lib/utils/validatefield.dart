class ValidateField {
  static String? validateString(String? v) {
    if (v == null || v == "") {
      return "Please fill data";
    }
    return null;
  }
}
