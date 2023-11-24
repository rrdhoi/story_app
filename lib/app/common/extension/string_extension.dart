extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrNotEmpty => this != null && this!.isNotEmpty;

  bool isEmail() => RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
      .hasMatch(this ?? '');

  bool isContainsUpperCase() {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])');
    return regExp.hasMatch(this!);
  }

  bool isContainsNumber() {
    RegExp regExp = RegExp(r'^(?=.*?[0-9])');
    return regExp.hasMatch(this!);
  }

  bool isContainsSpecialCharacter() {
    RegExp regExp = RegExp(r'^(?=.*?[.;!@#\$&*~_-])');
    return regExp.hasMatch(this!);
  }
}
