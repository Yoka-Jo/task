bool isEmailValid(String email) {
  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
}

bool isPasswordValid(String password) => password.length >= 6;

bool statusBool(var value) => value == "false" ? false : true;
