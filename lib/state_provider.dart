import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/state_notifier_provider.dart';
import 'package:riverpod_with_database/student_state.dart';

final studentProvider =
    StateNotifierProvider<StudentNotifierProvider, StudentState>((ref) {
  return StudentNotifierProvider();
});
