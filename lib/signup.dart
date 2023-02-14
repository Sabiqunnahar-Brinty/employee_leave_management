import 'package:employee_leave_management/account-inf.dart';
import 'package:employee_leave_management/appcolor.dart';
import 'package:employee_leave_management/customButton.dart';
import 'package:employee_leave_management/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customButton.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);


  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  signup()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  }

  void selectsignup(BuildContext ctsp)
  {
    Navigator.of(ctsp).push(MaterialPageRoute(builder: (_){
      return Signinpage();
    },),);
  }
  void signUptoFirebase()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar
        (SnackBar(content: Text('SIGN UP is complete'),));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(' Employee Leave Management System'),
        backgroundColor: AppColor.olive_green,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome Buddy!",
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
               padding: const EdgeInsets.all(20),
               child: TextField(
                controller:_emailController,
                 onChanged: (value){
                   email=value;
                 },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                  ),

                ),
             ),

             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller:_passController,
                onChanged: (value){
                password=value;
                },
                decoration: InputDecoration(
                  hintText: "password must be 6 character",
                  label: Text("Password"),
                  border: OutlineInputBorder(),
                  prefixIcon: IconButton(
                    onPressed: ()=>print('button-pressed'),
                    icon: Icon(Icons.email_outlined),
                  ),

                ),
              ),
            ),
            SizedBox(height: 40,),
            Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFBBBBBB),
              ),
            ),
            SizedBox(height: 20,),

          customButton("sign up",()=> {
          signUptoFirebase(),
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Userform(gmail: email,)))

        },
        ),

            SizedBox(height: 10,),
            
            Text('Already have an account?',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFBBBBBB),
              ),
            ),
            SizedBox(height: 15,),

            customButton("sign in",()=> {

                selectsignup(context)
              },
              ),

    ]
        ),
      )
    );



  }
}
