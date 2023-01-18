// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'coachs.dart';

class gymdetails extends StatefulWidget {
  const gymdetails({Key? key, required Type gymdetails}) : super(key: key);

  @override
  State<gymdetails> createState() => _gymdetailsState();
}

class _gymdetailsState extends State<gymdetails> {
  int activeIndex = 0;

  final List Imagelist = [
    'assets/images/Gym.png',
    'assets/images/Gym.png',
    'assets/images/Gym.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Gym Details",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => coach(coach: coach,),
                ),
              );
            },
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CarouselSlider.builder(
                itemCount: Imagelist.length,
                itemBuilder: (context, index, realIndex) {
                  final AssetImage = Imagelist[index];
                  return buildImage(AssetImage, index);
                },
                options: CarouselOptions(
                    height: 200,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
            SizedBox(height: 10),
            buildIndicator(Imagelist, activeIndex),
            const SizedBox(height: (40)),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Golden Gym",
                        style: (TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star_sharp,
                          color: Colors.yellow,
                        )),
                    const Text("4.5"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  const Expanded(
                    child: Text(
                      "Amman-jordan ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      )),
                  const Text("1.1KM"),
                ]),
                const Divider(thickness: 2, color: Colors.grey),
                IntrinsicHeight(
                  child: Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        )),
                    const VerticalDivider(color: Colors.grey, thickness: 2),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        )),
                    const Text("8:00 am-12:00 pm"),
                  ]),
                ),
                const Divider(thickness: 2, color: Colors.grey),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                    "lots of gyms and sports centers, close to where are you live, all in one app"),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('PhoneNumber:'),
                                const Text('07988888'),
                                ElevatedButton(
                                  child: const Text('Close '),
                                  onPressed: () => Navigator.pop(context),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Contact'),
                  
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                        const coach(coach: coach),
                      ),
                    );
                  },

                  color: Colors.black,
                  height: 45,
                  minWidth: 150,
                  // ignore: sort_child_properties_last
                  child: Text(
                    'Coaches',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ]),
            ))
          ]),
        ),
      ),
    );
  }
}

Widget buildIndicator(Imagelist, int activeIndex) => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.yellow),
      activeIndex: activeIndex,
      count: Imagelist.length,
    );

Widget buildImage(AssetImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        AssetImage,
        fit: BoxFit.cover,
      ),
    );
