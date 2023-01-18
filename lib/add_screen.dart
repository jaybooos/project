import 'package:flutter/material.dart';
import 'all_info_screen.dart';
import 'info_user.dart';

class UserData {
  String? userName;
  String? coachInfo;

  UserData({this.userName, this.coachInfo});
}

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final coachController = TextEditingController();

  validator() {
    UserData user = UserData(
      userName: nameController.text,
      coachInfo: coachController.text,
    );

    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("vaildate");
      Navigator.push(
        context,
        MaterialPageRoute(
          //هنا بعتنا القيم الي الشاشه الثانيه
          builder: (context) => CoachScreen(name: nameController.text, about: coachController.text, CoachScreen: Type,),
        ),
      );
    } else {
      print("not vaildate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15
              ),
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      controller: nameController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'About'),
                      controller: coachController,
                    ),

                    const SizedBox(
                      height: 100,
                    ),

                    // زر اضافه
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple,
                        ),
                        child: const Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => CoachScreen(
                                name: nameController.text,
                                about: coachController.text, CoachScreen: Type,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20,),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple,
                        ),
                        child: const Center(
                            child: Text(
                              'User',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                            )),
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => info_user(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
