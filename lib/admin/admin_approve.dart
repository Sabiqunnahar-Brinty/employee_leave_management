import 'dart:convert';

import 'package:employee_leave_management/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/admin_get.dart';

class Admin_approve extends StatefulWidget {
  const Admin_approve({Key? key}) : super(key: key);

  @override
  State<Admin_approve> createState() => _Admin_approveState();
}

class _Admin_approveState extends State<Admin_approve> {

  late Future<List<AdminShow>> future;
  Future<List<AdminShow>> fetchPost() async {

    var response= await http.get(Uri.parse('http://192.168.0.107/employee_leave_management/applied_leave_admin.php'),);
    print(response.statusCode);
    print(response.body);



    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<AdminShow>((json) => AdminShow.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
    }

    approve(String gmail)async{
      var response = await http.post(Uri.parse('http://192.168.0.107/employee_leave_management/applyleave.php'),
          body:jsonEncode(<String,String>{
            "gmail": gmail,
            "status" : "approve"

          }));

      print(response.body);
    }

  reject(String gmail)async{
    var response = await http.post(Uri.parse('http://192.168.0.107/employee_leave_management/applyleave.php'),
        body:jsonEncode(<String,String>{
          "gmail": gmail,
          "status" : "reject"

        }));

    print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
    future = fetchPost();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.olive_green,
          title: Center(child: Text("Admin")),
        ),

        body: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: FutureBuilder<List<AdminShow>>(
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
                        child: Container(
                          child:  Column(
                            children: [
                              Text(snapshot.data![index].gmail),
                              Text(snapshot.data![index].fromDate),
                              Text(snapshot.data![index].toDate),
                              Text(snapshot.data![index].reason),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: (){
                                        approve(snapshot.data![index].gmail);
                                      },
                                      child: Text("Appove")
                                  ),

                                  SizedBox(width: 20,),

                                  TextButton(
                                      onPressed: (){
                                        reject(snapshot.data![index].gmail);
                                      },
                                      child: Text("Reject")
                                  ),
                                ],
                              )

                            ],
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



      ),
    );
  }
}
