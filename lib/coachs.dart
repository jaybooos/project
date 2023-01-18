// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import 'all_info_screen.dart';
import 'coach_info.dart';
import 'home page.dart';

// ignore: camel_case_types
class coach extends StatelessWidget {
  const coach({Key? key, required Type coach}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: const Text("coach Info"),),

          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                    const home(home: home),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white70,
              )
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                    const coacheDetails(coacheDetails: coacheDetails),
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white70,
              )
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25, top: 20, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage(
                'assets/images/Personal.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Name ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text("Trainer"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 18,
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Working Time",
                    style:
                        (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.yellow,
                    )),
              ],
            ),
            IntrinsicHeight(
              child: Row(children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    )),
                const Text("sunday-tuesday-thursday"),
                const VerticalDivider(color: Colors.grey, thickness: 2),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    )),
              ]),
            ),
            const Divider(thickness: 2, color: Colors.grey),
            SizedBox(
              child: Row(
                children: [
                  const Text(" Experience"),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.system_update_alt_outlined,
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            const Divider(thickness: 2, color: Colors.grey),
            const SizedBox(
              height: 5,
            ),
            const Expanded(
              child: Text(
                "About",
                style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),

            ),
            const Expanded(
              child: Text(
                "personal trainer with......",
                style: (TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
              ),
            ),
            const Divider(thickness: 2, color: Colors.grey),
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
            )
          ],
        ),
      ),
    );
  }
}
