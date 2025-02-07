class StudentValidationMixin {
  // ignore: missing_return
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır";
    }
  }

  // ignore: missing_return
  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyad en az iki karakter olmalıdır";
    }
  }

  // ignore: missing_return
  String validateUrl(String value) {
    if (value.length < 2) {
      return ".....";
    }
  }

  // ignore: missing_return
  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır!";
    }
  }
}
