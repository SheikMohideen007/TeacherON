import 'package:flutter/material.dart';
import 'package:sample/sample2.dart';
import 'package:sample/screen2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double devHeight = 0.0, devWidth = 0.0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    print("$devHeight...$devWidth");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sample2');
            // Navigator.pushReplacementNamed(context, '/sample2');
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => Sample2()));
          },
          child: Icon(Icons.next_plan),
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text('Top of our Screen',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
          backgroundColor: Colors.blue,
        ),
        body: SizedBox(
          width: devWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                containerMethod(color: Colors.red, width: devWidth),
                SizedBox(
                  height: devHeight * 0.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      containerMethod(
                          color: Colors.blue, width: devWidth * 0.2),
                      containerMethod(color: Colors.red, width: devWidth * 0.2),
                      containerMethod(
                          color: Colors.green, width: devWidth * 0.2),
                      containerMethod(
                          color: Colors.purple, width: devWidth * 0.2)
                    ],
                  ),
                ),
                SizedBox(height: devHeight * 0.02),
                containerMethod(color: Colors.blue, width: devWidth),
                // SizedBox(height: devHeight * 0.02),
                containerMethod(color: Colors.green, width: devWidth),
                // SizedBox(height: devHeight * 0.02),
                containerMethod(color: Colors.grey, width: devWidth),
              ],
            ),
          ),
        ));
  }

  Widget containerMethod({required Color color, required double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
      child: Container(
        height: devHeight * 0.2,
        width: width,
        decoration: BoxDecoration(
            color: color,
            // borderRadius: BorderRadius.circular(20),
            // shape: BoxShape.circle,
            border: Border.all(
                color: Colors.black,
                width: 10,
                style: BorderStyle.solid,
                strokeAlign: 0)),
        child: Center(child: Text('Hello')),
      ),
    );
  }
}
