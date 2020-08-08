import 'package:engindemirog/models/student.dart';
import 'package:engindemirog/validation/student_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  buildImageUrlField(),
                  buildSubmitButton()
                ],
              )),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Ezgi"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Sarı"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldiğı Not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  buildImageUrlField() {
    return TextFormField(
      initialValue: selectedStudent.picsUrl,
      decoration: InputDecoration(labelText: "Resim Url", hintText: "www."),
      validator: validateUrl,
      onSaved: (String value) {
        selectedStudent.picsUrl = value;
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            saveStudent();
            Navigator.pop(context);
          }
        });
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
    print(selectedStudent.picsUrl);
  }
}
