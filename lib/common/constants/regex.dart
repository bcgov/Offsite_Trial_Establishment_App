abstract class AppRegex {
  static final email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+");
  static final digitsPhone = RegExp(r"^[0-9]{11}$");
}
