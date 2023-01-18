import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'storage.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                  child: Text("User Info"),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white70,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade900,
                        Colors.black,
                        Colors.grey.shade400,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                    child: Column(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        //صورة المتقدم
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 70.0,
                            backgroundImage: NetworkImage(
                                'https://www.pexels.com/photo/man-smiling-behind-wall-220453/')),
                        Text(
                          'Uplode Photo',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        //   Divider(thickness: 3, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    //  width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  )),
                              Text("Full Name", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Divider(thickness: 1, color: Colors.grey),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  )),
                              Text("E-mail", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Divider(thickness: 1, color: Colors.grey),
                          //  Column(
                          //   children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  )),
                              Text("Phone", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          /*  SizedBox(height:5),
                            TextField(
                              onChanged: (value){},
                              decoration:InputDecoration(hintText: "Phone",
                                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50)
                                    )
                                ),
                              ),),
                          ],
                        ),*/
                          Divider(thickness: 1, color: Colors.grey),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.password,
                                    color: Colors.grey,
                                  )),
                              Text("Password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          Divider(thickness: 1, color: Colors.grey),
                          Column(
                            children: [
                              Text(
                                "Day & Time  ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.calendar_month,
                                      color: Colors.grey,
                                    )),
                                const Text("sunday-tuesday-thursday"),
                                const VerticalDivider(
                                    color: Colors.black, thickness: 4),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    )),
                                const Text("10-12"),
                              ]),
                              Text(
                                "Gym Name & Coch Name ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.place,
                                      color: Colors.grey,
                                    )),
                                const Text("Gold Gym"),
                                const VerticalDivider(
                                    color: Colors.black, thickness: 4),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    )),
                                const Text("Ahmad Ali"),
                              ]),
                              Text(
                                "Location ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(thickness: 1, color: Colors.grey),
                          ElevatedButton(
                            child: const Text('Edit profile'),
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
