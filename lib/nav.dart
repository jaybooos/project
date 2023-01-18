import 'package:empower1/home%20page.dart';
import 'package:empower1/page_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
} //StatefulWidget

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final TabController controller;
  //متغير عشان يجيب اول شاشه في بداية التشغيل للابلكيشن
  int _index = 0;
  String myText = "Start";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = TabController(
      length: widgets.length,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //tab bar view
          TabBarView(
            controller: controller,
            children: widgets,
          ),
          //التحكم في الابعاد
          Positioned(
            bottom: 100,
            height: 60,
            left: 147,
            child: TabPageSelector(
              controller: controller,
              selectedColor: Colors.grey,
              indicatorSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
      //التنقل من اول شاشه الي اخر شاشه
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: SizedBox(
        width: 180,
        height: 50,
        child: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _index++;
              controller.animateTo(_index);
              if (_index == 0) {
                myText = "Start";
              } else if (_index == 1) {
                myText = "Next";
              } else if (_index == 2) {
                myText = "Next";
              } else if (_index == 3) {
                myText = "Get Start";
              } else if (_index > 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => home(
                              home: home,
                            )));
              }
            });
          },
          hoverElevation: 0,
          elevation: 0,
          label: Text(
            myText,
            textAlign: TextAlign.center,
            style: GoogleFonts.imFellFrenchCanon(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
