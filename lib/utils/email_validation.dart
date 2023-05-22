bool validEmail(String email) {
  return RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
      .hasMatch(email);
}
