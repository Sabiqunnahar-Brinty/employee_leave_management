import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_leave_management/appcolor.dart';
import 'package:employee_leave_management/confromleave.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'customButton.dart';

class Leavemanagement extends StatefulWidget {
  Leavemanagement({required this.gmail});
  String gmail;

  @override
  State<Leavemanagement> createState() => _LeavemanagementState();
}

class _LeavemanagementState extends State<Leavemanagement> {
  final _leavetypeController = TextEditingController();
  final _dobController = TextEditingController();
  final _dobtController = TextEditingController();
  final _contractNumController = TextEditingController();
  final _taskController = TextEditingController();
  final _reasonController = TextEditingController();
  List<String> leavetype = ["Annual", "Sick", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }
  Future<void> _selectDatetoPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobtController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  // addUserDataToDB()async{
  //
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var  currentUser = _auth.currentUser;
  //
  //   CollectionReference _collectionRef = FirebaseFirestore.instance.collection("leave-details");
  //   return _collectionRef.doc(currentUser!.email).set({
  //     "leavetype":_leavetypeController.text,
  //     "fromdate":_dobController.text,
  //     "todate":_dobtController.text,
  //     "contract":_contractNumController.text,
  //     "task":_taskController.text,
  //     "reason":_reasonController.text,
  //
  //
  //   }).then((value) => print("User Data Added")).catchError((error)=>print("something is wrong. $error"));
  // }

  applyleave()async{

    var response = await http.post(Uri.parse('http://192.168.0.107/employee_leave_management/applyleave.php'),
        body:jsonEncode(<String,String>{
          "gmail": widget.gmail,
          "leave_type":_leavetypeController.text,
          "from_date":_dobController.text,
          "to_date":_dobtController.text,
          "contract":_contractNumController.text,
          "task":_taskController.text,
          "reason":_reasonController.text,
          "status" : "Waiting for approval",
        }));

    print(response.body);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.olive_green,
        title: Text('leave and tour apply'
        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextField(
              controller: _leavetypeController,
              readOnly: true,
              decoration: InputDecoration(
                label: Text('leave type',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400

                  ),),
                border: OutlineInputBorder(),
                prefixIcon: DropdownButton<String>(
                  items: leavetype.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                      onTap: () {
                        setState(() {
                          _leavetypeController.text = value;
                        });
                      },
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            SizedBox(height: 30,),

            TextField(
              controller: _dobController,
              readOnly: true,
              decoration: InputDecoration(
                label: Text('From Date',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),) ,
                prefixIcon: IconButton(
                  onPressed: () => _selectDateFromPicker(context),
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _dobtController,
              readOnly: true,
              decoration: InputDecoration(
                label: Text('To Date',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),) ,
                prefixIcon: IconButton(
                  onPressed: () => _selectDatetoPicker(context),
                  icon: Icon(Icons.calendar_today_outlined),
                ),
              ),
            ),

            SizedBox(height: 40,),
            TextField(
              controller: _contractNumController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  label: Text('Contract no during leave',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ),) ,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call)

              ),
            ),
            SizedBox(height: 40,),
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                  label: Text('Task Assign to',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ),) ,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.task_outlined)

              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                label: Text('Reason for Application',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),) ,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30,),

            customButton("Continue",()=>{
              applyleave(),
              //addUserDataToDB(),
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfrimLeave(gmail: widget.gmail,)))
            }),
          ],
        ),
      ),
    );
  }
}
