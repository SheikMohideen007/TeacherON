import 'package:flutter/material.dart';

class Sample3 extends StatefulWidget {
  final String str;
  const Sample3({super.key, required this.str});

  @override
  State<Sample3> createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> {
  /*
  All button types
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.str),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sample4');
          },
          child: Icon(Icons.add)),
      body: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 10),
              onPressed: () {},
              child: Text('Elevated button')),
          TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {},
              child: Text('ok')),
          OutlinedButton(
              // style: OutlinedButton.styleFrom(
              //     backgroundColor: Colors.grey,
              //     foregroundColor: Colors.amberAccent),
              onPressed: () {},
              child: Text('Outlined')),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc_outlined))
        ],
      ),
    );
  }
}
