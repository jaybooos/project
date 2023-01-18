// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, sort_child_properties_last, avoid_print, non_constant_identifier_names, unused_import, unnecessary_null_comparison
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empower1/page_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'gyms.dart';

class MyPage1 extends StatefulWidget {
  const MyPage1({Key? key, required Type MyPage1}) : super(key: key);

  @override
  State<MyPage1> createState() => _MyPage1State();
}

class _MyPage1State extends State<MyPage1> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String readEmail = '';
  late String readPassword = '';
  int gv = 0;
  bool _validate = false;
  final _text=TextEditingController();
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black87,
                  Colors.black,
                  Color.fromARGB(255, 77, 81, 91),
                  Color.fromARGB(255, 125, 123, 122),
                ])),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 77, 81, 91),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.black87,
                            Color.fromARGB(255, 125, 123, 122),
                          ])),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/empower1.png',
                            height: 300,
                            width: 299,
                          ),
                          TextField(
                            // controller: _text,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Example@email.com',
                              hintStyle: TextStyle(color: Colors.white70),
                              labelText: 'Example@email.com',
                              labelStyle: TextStyle(color: Colors.white70),
                              errorText:
                                  _validate ? "Email can\'t be Empty" : null,
                              suffixIcon: Align(
                                widthFactor: 1,
                                heightFactor: 1,
                                child: Icon(Icons.email),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0,
                                    color: Colors.grey,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            style:
                                TextStyle(height: 1.2, color: Colors.white70),
                          ),
                          SizedBox(height: 15),
                          TextField(
                            // controller: _text,
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(color: Colors.white70),
                              labelText: 'password',
                              labelStyle: TextStyle(color: Colors.white70),
                              errorText:
                                  _validate ? "Password can\'t be Empty" : null,
                              suffixIcon: Align(
                                widthFactor: 1,
                                heightFactor: 1,
                                child: Icon(Icons.lock_outline),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27)),
                                  borderSide: BorderSide(
                                    color: Colors.white70,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0,
                                    color: Colors.white70,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(27),
                              ),
                            ),
                            style:
                                TextStyle(height: 1.2, color: Colors.white70),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white70),
                                  activeColor: Colors.orange,
                                  value: 1,
                                  groupValue: gv,
                                  onChanged: (value) {
                                    setState(() {
                                      gv = value!;
                                    });
                                  }),
                              Text(
                                'remember me',
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(width: 20),
                              TextButton(
                                onPressed: () {},
                                child: Text('Forgot password'),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          MaterialButton(
                            onPressed: () async {
                              setState(() {
                                _text.text.isEmpty ? _validate =true:_validate=false;
                              });
                              try {
                                final newUser =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const gymdetails(
                                          gymdetails: gymdetails),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('email', email);
                              prefs.setString('password', password);
                              print(email);
                              print(password);

                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const MyPage2(MyPage2: MyPage2)),
                              // );
                            },
                            color: Color.fromARGB(255, 106, 187, 218),
                            height: 45,
                            minWidth: 230,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          TextButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyPage2(
                                              MyPage2: MyPage2,
                                            )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Do not have an account',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyPage2(
                                                    MyPage2: MyPage2,
                                                  )));
                                    },
                                    child: Text('Sign up Now!!',
                                        style: TextStyle(
                                            color: Colors.amberAccent)),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/google-icon.svg',
                                        height: 25,
                                        width: 25)),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/facebook-2.svg',
                                        height: 25,
                                        width: 25)),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/twitter.svg',
                                        height: 25,
                                        width: 25)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
