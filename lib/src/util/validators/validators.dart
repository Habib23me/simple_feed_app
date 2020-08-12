class Validators {
  static const String PHONE_REGEX = r"^\9[0-9]{8}$";
  static const String CODE_REGEX = r"^\[0-9]{6}$";
  Validators._();
  static String validatePhone(String value) {
    return !checkRegex(PHONE_REGEX, value) ? "Invalid phone number." : null;
  }

  static String validateCode(String value) {
    return !checkRegex(PHONE_REGEX, value)
        ? "Invalid verification code."
        : null;
  }

  static bool checkRegex(String regex, String value) {
    var regExp = RegExp(regex);
    return regExp.hasMatch(value);
  }
}
