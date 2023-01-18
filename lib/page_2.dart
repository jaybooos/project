// ignore_for_file: prefer_const_constructors, avoid_print, avoid_types_as_parameter_names, non_constant_identifier_names, annotate_overrides
import 'package:empower1/page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({Key? key, required MyPage2}) : super(key: key);

  @override
  State<MyPage2> createState() => _MyPage2State();
}
const List<String> list = <String>['trainer', 'coach', 'gym owner'];
String dropdownValue = list.first;

class _MyPage2State extends State<MyPage2> {
  // final _auth = FirebaseAuth.instance;


  String pv ='passwords are not matched';

  late String x='';
  late String y='';
  late String email;
  late String password;
  late String Re_password;
  late String phoneNumber;
  late String fullName;
  late String read = '';
  late String userType='';
  bool _validate = false;
  bool _passowrdvalidate = false;
  final _text=TextEditingController();
  void dispose() {
    _text.dispose();
    super.dispose();
  }
  DocumentReference users = FirebaseFirestore.instance
      .collection('users')
      .doc('6Pc3fVt8PKyx0bd1dJ2E');
  void initState() {
    super.initState();
    users.get().then((DocumentSnapshot ds) {
      read = ds['email'];
      print(read);
    });
    print(read);
  }

  Future dataSinder() async {
    adduser(email, password, phoneNumber, fullName);
  }

  Future adduser(String email, String password, String phoneNumber,
      String fullName) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'fullName': fullName
    });
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
                          Colors.grey.shade700
                        ]
                    )
                ),

          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 77, 81, 91),
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [
                          Colors.black87,
                          Color.fromARGB(255, 125, 123, 122),
                        ])),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image.asset(
                      'assets/images/empower1.png',
                      height: 240,
                      width: 250,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: EdgeInsets.all(3),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) {
                        fullName = value.trim().toLowerCase();
                      },
                      decoration: InputDecoration(
                        errorText:
                        _validate ? "Name can\'t be Empty" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Icon(Icons.person),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
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
                      style: TextStyle(height: 1.2, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        email = value.toLowerCase();
                      },
                      decoration: InputDecoration(
                        errorText:
                        _validate ? "Email can\'t be Empty" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Example@email.com',
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: 'Example@email.com',
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Icon(Icons.email),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
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
                      style: TextStyle(height: 1.2, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        phoneNumber = value.trim();
                      },
                      decoration: InputDecoration(
                        errorText:
                        _validate ? "Phone Number can\'t be Empty" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Icon(Icons.phone),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
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
                      style: TextStyle(height: 1.2, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        password = value.trim();
                        x=value;
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        errorText:
                        _validate ? "password can\'t be Empty" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Icon(Icons.lock_outline),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
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
                      style: TextStyle(height: 1.2, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) {
                        Re_password = value.trim();
                        y=value;
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        errorText:
                        _validate ? "password can\'t be Empty" : null,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        hintText: 'Re-Password',
                        hintStyle: TextStyle(color: Colors.white70),
                        labelText: 'Re-Password',
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: Align(
                          widthFactor: 1,
                          heightFactor: 1,
                          child: Icon(Icons.lock_outline),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(27)),
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

                      style: TextStyle(height: 1.2, color: Colors.white70),
                    ),
                    //here
                  DropdownButton(
                    value: dropdownValue,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black87),
                    underline: Container(
                      height: 2,
                      color: Colors.black87,
                    ),
                    onChanged: (String? value) {
                      //a handler that execute an anonymous function
                      // This is called when the user selects an item.
                      userType=value!;
                      setState(() {
                        //reflect any changes to your framework
                        dropdownValue = value!; //non-null
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      //this is a map function that execute a function that gets us a string parameter
                      //which iterate all the items inside the list
                      return DropdownMenuItem<String>(
                        //this lets the user select on value from the list
                        value: value, //this is the what shows the dropDownValue
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                    // Row(
                    //   children: [
                    //     Radio(
                    //         fillColor: MaterialStateColor.resolveWith(
                    //             (states) => Colors.white70),
                    //         activeColor: Colors.orange,
                    //         value: 1,
                    //         groupValue: 0,
                    //         onChanged: (value) {}),
                    //     Text(
                    //       'I agree on terms & condations and privacy policy',
                    //       style: TextStyle(color: Colors.white70, fontSize: 11),
                    //     ),
                    //     SizedBox(width: 20),
                    //   ],
                    // ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _text.text.isEmpty ? _validate =true:_validate=false;
                        });
                        print(userType);
                        // Future signUp() async {
                        //   try {
                        //     await FirebaseAuth.instance
                        //         .createUserWithEmailAndPassword(
                        //             email: email.trim(),
                        //             password: password.trim());
                        //   } on FirebaseAuthException catch (e){print(e);}
                        // }
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email.trim(), password: password.trim());

                        dataSinder();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyPage1(MyPage1: MyPage1),
                          ),
                        );
                      },

                      color: Color.fromARGB(255, 106, 187, 218),
                      height: 45,
                      minWidth: 230,
                      // ignore: sort_child_properties_last
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    SizedBox(height: 5),
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
                              icon: SvgPicture.asset('assets/icons/twitter.svg',
                                  height: 25, width: 25)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 70),
                        const Text('Allready a member?',
                            style: TextStyle(color: Colors.white70)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPage1(
                                            MyPage1: MyPage1,
                                          )));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.amberAccent),
                            ))
                      ],
                    ),
                    SizedBox(height: 200)
                  ],
                ),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
