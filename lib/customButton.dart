import 'package:employee_leave_management/appcolor.dart';
import 'package:flutter/material.dart';


Widget customButton (String buttonText,onPressed){
  return Center(

    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColor.olive_green,
        elevation: 3,
      ),
    ),
  );
}