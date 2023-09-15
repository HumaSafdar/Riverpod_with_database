import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_database/state_provider.dart';
import 'package:riverpod_with_database/student.dart';
import 'package:riverpod_with_database/student_db_provider.dart';

import 'display_page.dart';

class MyInsertPage extends ConsumerStatefulWidget {
  const MyInsertPage({super.key});

  @override
  ConsumerState<MyInsertPage> createState() => _MyInsertPageState();
}

class _MyInsertPageState extends ConsumerState<MyInsertPage> {
  StudentDBProvider studentDBProvider = StudentDBProvider();
  TextEditingController nameController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void InsertStudent() async {
    bool isInserted = await studentDBProvider.insert(Student(
        name: nameController.text,
        rollNo: int.parse(rollnoController.text.toString()),
        fee: double.parse(feeController.text.toString())));
        fetchStudent();
  }
   void fetchStudent() {
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
                      hintText: 'Enter Name',
                      labelText: ' Name',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
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
                  maxLength: 3,
                  cursorColor: Color.fromARGB(255, 45, 72, 46),
                  controller: rollnoController,
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter RollNo',
                      labelText: ' RollNo',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
                TextFormField(
                  cursorColor: Color.fromARGB(255, 45, 72, 46),
                  controller: feeController,
                  // autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter fee',
                      labelText: 'Fee',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 45, 72, 46)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 45, 72, 46))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
                        InsertStudent();
                        nameController.text='';
                        rollnoController.text='';
                        feeController.text='';
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Data Inserted SuccessFully')));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MyDisplayPage();
                          },
                        ));
                      }
                    },
                    child: Text('Insert'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
