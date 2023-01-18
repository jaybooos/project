import 'package:flutter/material.dart';
class coacheDetails extends StatefulWidget {
  const coacheDetails({Key? key, required Type coacheDetails}) : super(key: key);

  @override
  State<coacheDetails> createState() => _coacheDetailsState();
}

class _coacheDetailsState extends State<coacheDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: const Text("coach Info"),)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) =>
                //     const home(home: home),
                //   ),
                // );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white70,
              )),
        ],
      ),

    );
  }
}
