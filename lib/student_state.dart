import 'package:flutter/material.dart';
import 'package:riverpod_with_database/student.dart';

@immutable
abstract class StudentState {}

@immutable
class StudentInitialState extends StudentState {}

@immutable
class StudentLoadingState extends StudentState {}

@immutable
class StudentLoadedState extends StudentState {
  final List<Student> students;
  StudentLoadedState({required this.students});
}

@immutable
class StudentErrorState extends StudentState {
  final String errorMessage;
  StudentErrorState({required this.errorMessage});
}
