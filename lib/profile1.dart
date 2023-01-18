// ignore_for_file: camel_case_types, unused_import, prefer_const_constructors

import 'package:empower1/home%20page.dart';
import 'package:flutter/material.dart';
import 'package:flat_3d_button/flat_3d_button.dart';

class profile extends StatefulWidget {
  const profile({Key? key, required Type profile}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color.fromARGB(255, 77, 81, 91),
                    Color.fromARGB(255, 125, 123, 122),
                    Colors.grey.shade700
                  ]
              )
          ),          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                              const home(home: home),
                            ),
                          );
                        },
                        icon: Icon(Icons.keyboard_backspace_rounded),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.access_time_filled,color: Colors.white70,),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/ahmad.png'),
                        radius: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(

                        margin: EdgeInsets.only(right: 20),
                        child:  Text("Full Name",
                            style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.start,),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Enter your Name",

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 106, 187, 218),
                              ), //<-- SEE HERE
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child:  Text("Email",
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 106, 187, 218),), //<-- SEE HERE
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(

                        margin: EdgeInsets.only(right: 20),
                        child:  Text("About",
                            style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 5,),
                      TextField(
                        maxLines: 5,
                        minLines: 1,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: " Tell us about yourself",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                              borderSide: BorderSide(
                                  width: 3, color: Color.fromARGB(255, 106, 187, 218),), //<-- SEE HERE
                            ),
                            // contentPadding: EdgeInsets.symmetric(vertical: 50),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.white70),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                    ),
                     child: MaterialButton(
                       onPressed: () {},
                       color: Color.fromARGB(255, 106, 187, 218),
                       height: 45,
                       minWidth: 230,
                       // ignore: sort_child_properties_last
                       child: Text(
                         'save',
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.white,
                         ),
                       ),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(30))),
                     ),
                     //ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Save",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     style: ButtonStyle(
                    //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //             RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(18.0),
                    //
                    //             )
                    //         )
                    //     )
                    // ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
