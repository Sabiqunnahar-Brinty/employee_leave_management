import 'package:employee_leave_management/Homepage.dart';
import 'package:employee_leave_management/appcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

   final _auth = FirebaseAuth.instance;
   late String email;
   late String password;
   String name='';



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title:Text('Employee Leave Management system'),
        backgroundColor: AppColor.olive_green,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 22, color: AppColor.olive_green),
            ),
            Text(
              "Glad to see you back my buddy.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFBBBBBB),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller:_emailController,
                onChanged: (value){
                  email=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: IconButton(
                    onPressed: ()=>print('button-pressed'),
                    icon: Icon(Icons.email_outlined),
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller:_passController,
                onChanged: (value){
                  password=value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your passord',
                  border: OutlineInputBorder(),
                  prefixIcon:Icon(Icons.email_outlined),
                  ),

                ),
            ),

            SizedBox(height: 40,),

            TextButton(
              onPressed: () async {
              final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
               if(user!=null)
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage(gmail: email,)));
              },
              child:Text('lOGING'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(AppColor.olive_green)
              ),


            ),
          ],
        ),
      )
    );

  }
}
