class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String picsUrl;
  // ignore: unused_field
  String _status;

  Student.withId(
      int id, String firstName, String lastName, int grade, String picsUrl) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.picsUrl = picsUrl;
    //this.status = 'Gecti';
  }

  Student(String firstName, String lastName, int grade, String picsUrl) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.picsUrl = picsUrl;
  }

  Student.withoutInfo();
  // String get getFirstName {
  //   return "OGR - " + this.firstName;
  // }

  // void set setFirstName(String value) {
  //   this.firstName = value;
  // }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Gecti";
    } else if (this.grade >= 40) {
      message = "Bute kaldi";
    } else {
      message = "kaldi";
    }
    return message;
  }
}
