import 'dart:ui';

import 'package:deficient_calculator/core/widgets/text_related_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/api_example_provider.dart';

class ApiExample extends StatefulWidget {
  ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController employeeSalaryController = TextEditingController();
  TextEditingController employeeAgeController = TextEditingController();

  FocusNode employeeNameFocusController = FocusNode();
  FocusNode employeeSalaryFocusController = FocusNode();
  FocusNode employeeAgeFocusController = FocusNode();

  @override
  void dispose() {
    employeeNameController.dispose();
    employeeSalaryController.dispose();
    employeeAgeController.dispose();
    employeeNameFocusController.dispose();
    employeeAgeFocusController.dispose();
    employeeSalaryFocusController.dispose();
    super.dispose();
  }

  Future<void> initData() async {
    try {
      await context.read<ApiProvider>().getData();
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    super.initState();

    initData();
  }

  @override
  Widget build(BuildContext mainContext) {
    return Consumer<ApiProvider>(
      builder: (BuildContext context, ApiProvider value, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_outlined),
          ),
          title: Text('ApiExample'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async{
                await initData();
                // context.read<ApiProvider>().getData();
                print('api hit');
              },
              icon: Icon(Icons.repeat),
            ),
          ],
        ),
        body: value.list.isEmpty?Center(child: Text("No Data Found"),): ListView.builder(

          itemCount: value.list.length,
          itemBuilder: (_, index) {
            final employeeData = value.list[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(employeeData.id.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        Text("Name: ${employeeData.employeeName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Salary: ${employeeData.employeeSalary}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),

                    Text("Age: ${employeeData.employeeAge}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: mainContext,
              builder: (_) => BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customTextFormField(
                          labelText: 'Name',
                          controller: employeeNameController,
                          focusNode: employeeNameFocusController,
                          validator: (value) {
                            if (value == null) {
                              return "Please enter value";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        customTextFormField(
                          labelText: 'Age',
                          controller: employeeAgeController,
                          focusNode: employeeAgeFocusController,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value == null) {
                              return "Please enter value";
                            }
                            int num = int.parse(value);
                            if (num < 18) {
                              return "age must be greater than 18";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        customTextFormField(
                          labelText: 'Salary',
                          controller: employeeSalaryController,
                          focusNode: employeeSalaryFocusController,
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value == null) {
                              return "Please enter value";
                            }
                            int num = int.parse(value);
                            if (num < 10_000) {
                              return "salary must be greater than 10,000";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        
                        TextButton(onPressed: () {}, child: Text("data"))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
