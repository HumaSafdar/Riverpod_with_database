import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/main.dart';
import 'package:riverpod_with_database/state_provider.dart';
import 'package:riverpod_with_database/student.dart';
import 'package:riverpod_with_database/student_db_provider.dart';
import 'package:riverpod_with_database/student_state.dart';
import 'package:riverpod_with_database/update_Page.dart';

import 'myPage.dart';

class MyDisplayPage extends ConsumerStatefulWidget {
  const MyDisplayPage({super.key});

  @override
  ConsumerState<MyDisplayPage> createState() => _MyDisplayPageState();
}

class _MyDisplayPageState extends ConsumerState<MyDisplayPage> {
  StudentDBProvider studentDBProvider = StudentDBProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 72, 46),
        title: Text('Display Page'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(studentProvider);
          if (state is StudentInitialState) {
            return StudentInitialWidget();
          } else if (state is StudentLoadingState) {
            return StudentLoadingWidget();
          } else if (state is StudentLoadedState) {
            return StudentLoadedWidget(student: state.students);
          } else {
            return StudentErrorWidget(
                errorMessage: (state as StudentErrorState).errorMessage);
          }
        },
      ),
    );
  }
}

class StudentInitialWidget extends StatelessWidget {
  const StudentInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
              color: Color.fromARGB(255, 45, 72, 46))),
    );
  }
}

class StudentLoadingWidget extends StatelessWidget {
  const StudentLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
              color: Color.fromARGB(255, 45, 72, 46))),
    );
  }
}

class StudentLoadedWidget extends ConsumerStatefulWidget {
  StudentLoadedWidget({super.key, required this.student});
  final List<Student> student;

  @override
  ConsumerState<StudentLoadedWidget> createState() =>
      _StudentLoadedWidgetState();
}

class _StudentLoadedWidgetState extends ConsumerState<StudentLoadedWidget> {
  StudentDBProvider studentDBProvider = StudentDBProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemCount: widget.student.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 45, 72, 46),
                child: Text(widget.student[index].rollNo.toString()),
              ),
              title: Column(
                children: [
                  Text(widget.student[index].name),
                  Text(widget.student[index].fee.toString()),
                ],
              ),
              subtitle: IconButton(
                  color: Color.fromARGB(255, 45, 72, 46),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MyUpdatePage(index: index,students: widget.student);
                      },
                    ));
                  },
                  icon: Icon(Icons.edit)),
              trailing: IconButton(
                  color: Color.fromARGB(255, 45, 72, 46),
                  onPressed: () async {
                    await studentDBProvider
                        .delete(widget.student[index].rollNo);
                    ref.read(studentProvider.notifier).fetch();
                  },
                  icon: Icon(Icons.delete)),
            ),
          );
        },
      )),
    );
  }
}

class StudentErrorWidget extends StatelessWidget {
  const StudentErrorWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.red,
        child: Text(errorMessage.toString()),
      ),
    );
  }
}



  // trailing: IconButton(
                    //     onPressed: () async {
                    //       bool isDeleted = await studentDBProvider
                    //           .delete(studentsss[index].rollno);
                    //       if (isDeleted) {
                    //         print('Deleted SuccessFully');
                    //         fetchStudents();
                    //       } else {
                    //         print('Not Deleted');
                    //       }
                    //     },
                    //     icon: Icon(Icons.delete)),
                  



                  /**
                   * 
                   * 
                   * 
                   *  ListView.builder(
              itemCount: widget.studentsss.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(widget.studentsss[index].rollNo.toString())),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.studentsss[index].name),
                        Text(widget.studentsss[index].fee.toString()),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop(MyInsertPage());
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                );
              },
            )
                   */