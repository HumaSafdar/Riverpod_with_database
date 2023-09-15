import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/myPage.dart';
import 'package:riverpod_with_database/state_provider.dart';
import 'package:riverpod_with_database/student.dart';
import 'package:riverpod_with_database/student_db_provider.dart';
import 'package:riverpod_with_database/student_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyInsertPage(),
      ),
    );
  }
}






// class MyHomePage extends ConsumerStatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   ConsumerState<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends ConsumerState<MyHomePage> {
//   StudentDBProvider studentDBProvider = StudentDBProvider();
//   Future<void> insert() async {
//     //List<Student> state = [];
//     bool isInserted = await studentDBProvider
//         .insert(Student(rollNo: 1, name: 'shahzaib', fee: 75880.0));
//       //  ref.read(studentProvider.notifier).fetch() ;
//     if (isInserted) {
//       print('Inserted SuccessFully');
//     } else {
//       print('Not Insertted');
//     }
//   }

//   void fetchStudent() {
//     ref.read(studentProvider.notifier).fetch() ;

//        // print('????????????????????????????????');

//   }

//   @override
//   Widget build(BuildContext context) {
//     var state = ref.watch(studentProvider);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Consumer(
//           builder: (context, ref, child) {
//             //var state = ref.watch(studentProvider);
//             if (state is StudentInitialState) {
//               return const StudentInitialWidget();
//             } else if (state is StudentLoadingState) {
//               return const StudentLoadingWidget();
//             } else if (state is StudentLoadedState) {
//               return StudentLoadedWidget(student: state.students);
//             } else {
//               return StudentErrorWidget(
//                   errorMessage: (state as StudentErrorState).errorMessage);
//             }
//           },
//         ),
//         floatingActionButton: ButtonBar(
//           children: [
//             FloatingActionButton(
//                 onPressed: ()async{
//                    StudentDBProvider studentDBProvider = StudentDBProvider();
//                    await studentDBProvider.insert(Student(rollNo: 1, name: 'talha', fee: 12.56));
//                 }, tooltip: 'insert', child: Text('Insert')),
//             FloatingActionButton(
//               onPressed: () async{
//                  var data= await ref.read(studentProvider.notifier).fetch();
                 
//               },
//                 tooltip: 'fetch',
//                 child: Text('Fetch')),
//           ],
//         ));
//   }
// }

// class StudentInitialWidget extends StatelessWidget {
//   const StudentInitialWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Click here to fetch students')),
//     );
//   }
// }

// class StudentLoadingWidget extends StatelessWidget {
//   const StudentLoadingWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class StudentLoadedWidget extends StatelessWidget {
//   const StudentLoadedWidget({super.key, required this.student});
//   final List<Student> student;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: ListView.builder(itemCount: student.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: CircleAvatar(
//               child: Text(student[index].rollNo.toString()),
//             ),
//             title: Text(student[index].name),
//         trailing: Text(student[index].fee.toString()),
//           );
//         },
//       )),
//     );
//   }
// }

// class StudentErrorWidget extends StatelessWidget {
//   const StudentErrorWidget({required this.errorMessage, super.key});
//   final String errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         color: Colors.red,
//         child: Text(errorMessage.toString()),
//       ),
//     );
//   }
// }
