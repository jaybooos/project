import 'package:flutter/material.dart';

class info_user extends StatefulWidget {
  const info_user({Key? key}) : super(key: key);

  @override
  State<info_user> createState() => _info_userState();
}

class _info_userState extends State<info_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
          child: Column(
            children: [
              /*Container(height: 150,
              child:
            Icon(Icons.arrow_back),),*/
              Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 70.0,
                        backgroundImage: NetworkImage(
                            'https://www.pexels.com/photo/man-smiling-behind-wall-220453/'),
                      ),
                      Positioned(
                          right: 10,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo ,
                              size: 40,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Uplode Photo',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(thickness: 1, color: Colors.grey),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      icon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      icon: Icon(
                        Icons.email,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Phone",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      icon: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "social Media",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      icon: Icon(
                        Icons.app_shortcut,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "About",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      icon: Icon(
                        Icons.info,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(thickness: 1, color: Colors.grey),
              Column(
                children: [
                  Text(
                    "Day & Time  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        )),
                    const Text("sunday-tuesday-thursday"),
                    const VerticalDivider(color: Colors.black, thickness: 4),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        )),
                    const Text("10-12"),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gym Name & Coch Name ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.place,
                          color: Colors.grey,
                        )),
                    const Text("Gold Gym"),
                    const VerticalDivider(color: Colors.black, thickness: 4),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                    const Text("Ahmad Ali"),
                  ]),
                ],
              ),
              Divider(thickness: 1, color: Colors.grey),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 15,
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(50),
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 200,
                  height: 50,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
