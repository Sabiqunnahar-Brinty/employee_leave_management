import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_leave_management/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/applied_leave.dart';

class ConfrimLeave extends StatefulWidget {

  ConfrimLeave({required this.gmail});
  String gmail;


  @override
  State<ConfrimLeave> createState() => _ConfrimLeaveState();
}

class _ConfrimLeaveState extends State<ConfrimLeave> {

  CollectionReference _collectionReference = FirebaseFirestore.instance.collection("leave-details");
    Stream<QuerySnapshot> ?_streamdeatails;

  late Future<List<AppliedLeave>> future;

  Future<List<AppliedLeave>> fetchPost() async {

    print(widget.gmail);
    var response= await http.post(Uri.parse('http://192.168.0.107/employee_leave_management/applied_leave.php'),body:
    jsonEncode(<String, String>{
      "gmail": widget.gmail
    })
    );
    print(response.statusCode);
    print(response.body);



    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();


      return parsed.map<AppliedLeave>((json) => AppliedLeave.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _collectionReference.snapshots();
    fetchPost();
    future = fetchPost();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('leave and tour'),
        backgroundColor: AppColor.olive_green,
      ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: FutureBuilder<List<AppliedLeave>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10,right: 10),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [

                            SizedBox(height: 20,),
                             Text("Leave Type:"+ snapshot.data![index].leaveType,),

                              SizedBox(height: 20,),
                              Text("From date:"+ snapshot.data![index].fromDate),
                              SizedBox(height: 20,),
                              Text("To date:"+ snapshot.data![index].toDate),
                              SizedBox(height: 20,),
                              Text("Reason:"+snapshot.data![index].reason),
                              SizedBox(height: 20,),
                              Text("Status:"+snapshot.data![index].status),

                        
                         ] ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  //will add a gif here
                  child: Column(
                    children: [
                      //CircularProgressIndicator(),
                      Text("Loading..."),
                    ],
                  ),
                );
              }
            },
          )),


      // StreamBuilder<QuerySnapshot>(
      //   stream:_streamdeatails ,
      //   builder: (BuildContext context,AsyncSnapshot snapshot){
      //     if(snapshot.hasError){
      //       return Center(child: Text(snapshot.error.toString()));
      //     }
      //     if(snapshot.connectionState==ConnectionState.active)
      //     {
      //       QuerySnapshot querySnapshot = snapshot.data;
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      //
      // ) ,
    );
  }
}
