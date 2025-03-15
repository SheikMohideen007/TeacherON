import 'package:flutter/material.dart';

class Sample8 extends StatefulWidget {
  const Sample8({super.key});

  @override
  State<Sample8> createState() => _Sample8State();
}

class _Sample8State extends State<Sample8> {
  double devHeight = 0.0, devWidth = 0.0;
  bool isVisibile = true;
  // Visibility
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.purple,
      ),
      body: Column(children: [
        Visibility(
            visible: isVisibile,
            replacement: Text('No Data'),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            )),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isVisibile = !isVisibile;
              });
            },
            child: Text('Press me'))
      ]),
    );
  }
}
