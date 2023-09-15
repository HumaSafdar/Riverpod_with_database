import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/display_page.dart';
import 'package:riverpod_with_database/state_provider.dart';
import 'package:riverpod_with_database/student.dart';
import 'package:riverpod_with_database/student_db_provider.dart';

class MyUpdatePage extends ConsumerStatefulWidget {
    MyUpdatePage({required this.students,required this.index, super.key});
int index;
List<Student> students; 
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyUpdatePageState();
}

class _MyUpdatePageState extends ConsumerState<MyUpdatePage> {
  StudentDBProvider studentDBProvider = StudentDBProvider();
  TextEditingController nameController = TextEditingController();
   TextEditingController feeController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  
  void updateStudent() async {
    
   
    await studentDBProvider.Update(Student(
        rollNo:widget. students[widget.index].rollNo,
        name: nameController.text,
        fee: double.parse(feeController.text)));
    FetchStudent();
  }

  void FetchStudent() async {
    ref.read(studentProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 72, 46),
        title: Text('Insert Data'),
      ),
      body: Center(
        child: Form(
          key: formState,
          child: SizedBox(
            height: height * 0.7,
            width: width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  cursorColor: Color.fromARGB(255, 45, 72, 46),
                  controller: nameController,
                  //autofocus: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: widget.students[widget.index].name,
                      labelText: ' Name',
                      labelStyle:
                         const  TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                           
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is Required';
                    } else {
                      return null;
                    }
                  },
                ),
               



                TextFormField(
                  cursorColor: Color.fromARGB(255, 45, 72, 46),
                  controller: feeController,
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText:widget.students[widget.index].fee.toString(),
                      labelText: 'Fee',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fee is required';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 45, 72, 46)),
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        updateStudent();

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Data Updated SuccessFully')));
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (context) {
                            return MyDisplayPage();
                          },
                        ));
                      }
                    },
                    child: Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/**
 * 
 *  TextFormField(
                  cursorColor: Color.fromARGB(255, 45, 72, 46),
                  controller: rollnoController,
                  maxLength: 3,
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter RollNo',
                      labelText: ' RollNo',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'RollNo is required';
                    } else {
                      return null;
                    }
                  },
                ),
 */