import 'package:employee_leave_management/appcolor.dart';
import 'package:employee_leave_management/attendence.dart';
import 'package:employee_leave_management/leavemanagement.dart';
import 'package:employee_leave_management/notification.dart';
import 'package:employee_leave_management/profile.dart';
import 'package:flutter/material.dart';

import 'confromleave.dart';

class homepage extends StatefulWidget {
  homepage({required this.gmail}) ;
  String gmail;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void selectnotify(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return Notificationss();
        },
      ),
    );
  }

  void selectleave(BuildContext ctxs) {
    Navigator.of(ctxs).push(
      MaterialPageRoute(
        builder: (_) {
          return Leavemanagement(gmail: widget.gmail);
        },
      ),
    );
  }

  void selectprofle(BuildContext ctz) {
    Navigator.of(ctz).push(
      MaterialPageRoute(
        builder: (_) {
          return Profile();
        },
      ),
    );
  }

  void selectattendence(BuildContext ctd) {
    Navigator.of(ctd).push(
      MaterialPageRoute(
        builder: (_) {
          return Attendence();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.olive_green,
        title: Text(
          'Employee Leave Manegement',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 25, left: 25, bottom: 25),
                  child:Container(
                    width: 100,
                    height: 100,
                    child:
                    CircleAvatar(
                      backgroundColor: AppColor.olive_green,
                      backgroundImage: AssetImage(
                        'assets/images/pro1.jpg',
                      ),
                    ),
                  )
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfrimLeave(gmail: widget.gmail,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 140,
                      height: 200,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/images/notifi1.jpg"),
                          fit: BoxFit.fill,
                        ),
                        color: AppColor.olive_green,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(blurRadius: 11, spreadRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => selectleave(context),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 140,
                      height: 200,
                      child: Center(child: Text('')),
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/images/tour2.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(blurRadius: 11, spreadRadius: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => selectattendence(context),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 140,
                      height: 200,
                      child: Text(''),
                      decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/images/atten1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          color: AppColor.olive_green,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(blurRadius: 11, spreadRadius: 8),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 140,
                    height: 200,
                    child: Center(child: Text('')),
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/images/salaryf.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.cyan,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(blurRadius: 11, spreadRadius: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
