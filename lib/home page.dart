// ignore_for_file: camel_case_types, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:empower1/gyms.dart';
import 'package:empower1/page_1.dart';
import 'package:empower1/profile1.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'coachs.dart';
import 'map.dart';

class home extends StatefulWidget {
  const home({Key? key, required Type home}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _current = 0;
  final _controller = PageController();
  List images = [
    "assets/images/golds.png",
    "assets/images/fitness.png",
  ];
  List images2 = [
    "assets/images/ahmad.png",
    "assets/images/ali.png",
    "assets/images/yazan.png"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.black,
                  Color.fromARGB(255, 77, 81, 91),
                  Color.fromARGB(255, 125, 123, 122),
                ]),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // text (location)
                  Container(
                    margin: EdgeInsets.only(right: 300),

                  ),
                  SizedBox(
                    height: 13,
                  ),
                  // location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                          Text(
                            "Amman,Jordan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.add_alert_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //search box
                  Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.only(right: 60, top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //text button
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Gym",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Swim",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //first row slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "        Near by sport clubs",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                const gymdetails(gymdetails: gymdetails),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 230,
                        child: PageView(
                          controller: _controller,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const gymdetails(gymdetails: gymdetails),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/golds.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Golds Gym",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/fitness.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Fitness One",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 2,
                        effect: ExpandingDotsEffect(
                            dotHeight: 20,
                            dotWidth: 20,
                            spacing: 15,
                            dotColor: Colors.black,
                            activeDotColor: Colors.white),
                      ),
                    ],
                  ),

                  Divider(thickness: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Coaches",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                const MyPage1(MyPage1: MyPage1),
                              ),
                            );
                          },
                          child: Text(
                            "                                                   See All",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // page view for the coaches
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 230,
                        child: PageView(
                          controller: _controller,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const coach(coach: coach),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/ahmad.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Coach Ahmad",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/kareem.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Coach Kareem",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/mike.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Coach Mike",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            dotHeight: 20,
                            dotWidth: 20,
                            spacing: 15,
                            dotColor: Colors.black,
                            activeDotColor: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
            //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            backgroundColor: Colors.transparent,
            color: const Color.fromRGBO(92, 96, 106, 1),
            height: 50,
            animationDuration: const Duration(milliseconds: 200),
            items: const [
              Icon(
                Icons.home,
                size: 35,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
              Icon(
                Icons.favorite,
                size: 35,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
              Icon(
                Icons.search,
                size: 35,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
              Icon(
                Icons.map,
                size: 35,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
              Icon(
                Icons.person,
                size: 35,
                color: Color.fromRGBO(1, 1, 1, 1),
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                setState(() {});
              } else if (index == 1) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const profile(profile: profile),
                    ),
                  );
                });
              } else if (index == 2) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyPage1(MyPage1: MyPage1),
                    ),
                  );
                });
              } else if (index == 3) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyMap(MyMap: MyMap),
                    ),
                  );
                });
              } else if (index == 4) {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const coach(coach: coach),
                    ),
                  );
                });
              }
            }),
      ),
    );
  }
}
