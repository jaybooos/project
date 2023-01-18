
// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nav.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page_2.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MyApp(),
      'page1': (context) => const screen1(),
      'page2': (context) => const Screen2(),
      'page3': (context) => const Screen3(),
      'page4': (context) => const Screen4(),
      'page_1':(context) => const MyPage2(MyPage2: MyPage2,)

    },
  ));
}

// قائمه بها الاربع شاشات screen1 + screen2 + screen3 + screen4
List<Widget> widgets = [
  const screen1(),
  const Screen2(),
  const Screen3(),
  const Screen4(),
  const MyPage2(MyPage2: MyPage2,)
];



