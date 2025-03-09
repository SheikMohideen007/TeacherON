import 'package:flutter/material.dart';

class Sample6 extends StatefulWidget {
  const Sample6({super.key});

  @override
  State<Sample6> createState() => _Sample6State();
}

class _Sample6State extends State<Sample6> {
  double devHeight = 0.0, devWidth = 0.0;
  /*
  Wrap
  */
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Text('Next')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          width: devWidth,
          height: devHeight * 0.5,
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: 20,
            runSpacing: 30,
            children: [
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
              // container(),
            ],
          ),
        ),
      ),
    );
  }

  Padding container() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
    );
  }
}
