import 'package:employee_leave_management/appcolor.dart';
import 'package:flutter/material.dart';
class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.olive_green,
        title: Text( ' Attendence '),
      ),
      body: Center(
        child: Text( 'Attendence'),
    ),
);}
}
