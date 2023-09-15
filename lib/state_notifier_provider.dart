import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/student_db_provider.dart';
import 'package:riverpod_with_database/student_state.dart';

class StudentNotifierProvider extends StateNotifier<StudentState> {
  StudentNotifierProvider() : super(StudentInitialState());
  StudentDBProvider studentDBProvider = StudentDBProvider();
  Future<dynamic> fetch() async {
    state = StudentLoadingState();
    try {
      var students = await studentDBProvider.fetch();
      state = StudentLoadedState(students: students);
    } catch (e) {
      state = StudentErrorState(errorMessage: e.toString());
    }
  }
}
