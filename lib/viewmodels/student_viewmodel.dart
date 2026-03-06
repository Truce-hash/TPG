import 'package:flutter/foundation.dart'; // For ChangeNotifier
import '../models/student_model.dart';

class StudentViewModel extends ChangeNotifier {
  //Private Data
  StudentModel _student = StudentModel(
    name: "Mpho",
    currentSubject: "TPG316C",
    subjects: ["TPG316C", "SOD316C", "CMN316C", "ITS316C"],
    studentGrade: 85,
    currentIndex: 0,
  );

  // PUBLIC GETTERS - controlled access to data
  String get studentName => _student.name;
  String get currentSubject => _student.currentSubject;
  List<String> get subjects => _student.subjects;
  int get studentGrade => _student.studentGrade;
  int get currentIndex => _student.currentIndex;

  // LOGIC METHOD - contains the business logic
  void changeSubject() {
    //Change subject
    int newIndex = (_student.currentIndex + 1) % _student.subjects.length;
    String newSubject = _student.subjects[newIndex];
    //Update the model using copyWith
    _student = _student.copyWith(
      currentIndex: newIndex,
      currentSubject: newSubject,
    );
    //Notify the UI
    notifyListeners();
  }

  void increaseGrade() {
    int newGrade = (_student.studentGrade + 1);
    if (newGrade == 100) {
      newGrade = 100;
    }

    _student = _student.copyWith(studentGrade: newGrade);

    notifyListeners();
  }

  void decreaseGrade() {
    int newGrade = (_student.studentGrade - 1);
    if (newGrade == 0) {
      newGrade = 0;
    }
    _student = _student.copyWith(studentGrade: newGrade);
    notifyListeners();
  }
}
