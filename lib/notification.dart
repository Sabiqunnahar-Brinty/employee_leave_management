import 'package:employee_leave_management/appcolor.dart';
import 'package:flutter/material.dart';

class Notificationss extends StatefulWidget {
  const Notificationss({Key? key}) : super(key: key);

  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.olive_green,
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notification page'),
      ),
    );
  }
}
