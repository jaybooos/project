import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'storage.dart';

class CoachScreen extends StatefulWidget {
  // هنخلي الشاشه التانيه تستقبل متغيرين نصي واحد name و واحد about
  final String name;
  final String about;

  const CoachScreen({
    Key? key,
    required this.name,
    required this.about, required Type CoachScreen,

  }) : super(key: key);

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  List<String> listitems = ['Trainer', 'Coach', 'GYM Owner'];
  String selectval = "Trainer";

  @override
  Widget build(BuildContext context) {
    //بتاخذ قيمة الاسم المختار داخل dropdown
    /*  var items = ['Trainer', 'Coach', 'GYM Owner'];
    String userType = 'Trainer';*/
    final Storage storage = Storage();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text("coach Info"),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 20, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //صورة المتقدم
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                      'https://www.pexels.com/photo/man-smiling-behind-wall-220453/'),
                ),
                Positioned(
                    right: 5,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 30,
                      ),
                    ))
              ],
            ),

            ElevatedButton(
              onPressed: () async {
                final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg']);

                if (results == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('no file selecte'),
                    ),
                  );
                  return null;
                }
                final path = results.files.single.path!;
                final fileName = results.files.single.name;
                storage
                    .uploadFile(path, fileName)
                    .then((value) => print('done'));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('Upload image profile'),
            ),

            FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            onPressed: () {},
                            child: Text(snapshot.data!.items[index].name),
                          );
                        }),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              },
            ),

            FutureBuilder(
              future: storage.downloadURL(''),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    width: 300,
                    height: 250,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              },
            ),

            const Divider(thickness: 2, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            //اسم المتقدم
            Text(
              widget.name,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              ' $selectval',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
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
            Row(children: [
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
            const Divider(thickness: 2, color: Colors.grey),
            Row(
              children: [
                DropdownButton(
                  value: selectval,
                  onChanged: (value) {
                    setState(() {
                      selectval = value.toString();
                    });
                  },
                  items: listitems.map((itemone) {
                    return DropdownMenuItem(
                        value: itemone, child: Text(itemone));
                  }).toList(),
                ),
                const Text(" Experience"),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.system_update_alt_outlined,
                      color: Colors.grey,
                    )),
              ],
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
            Center(child: Text(widget.about)),
            /*  const Expanded(
              child: Text(
                "coachInfo",
                style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
           const Expanded(
              child: Text(
                "personal trainer with......",
                style: (TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
              ),
            ),*/
            const Divider(thickness: 2, color: Colors.grey),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('PhoneNumber:'),
                            const Text('07988888'),
                            ElevatedButton(
                              child: const Text('Close '),
                              onPressed: () {},
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
