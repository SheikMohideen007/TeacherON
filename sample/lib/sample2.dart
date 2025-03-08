import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/sample3.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key});

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  /*
popup menu button
richtext
icon
listtile
image-> asset, network
imageprovider -> AssetImage,NetworkImage
CircleAvatar
Container -> background Image
Card
  */
  double devHeight = 0.0, devWidth = 0.0;
  int popValue = 1;
  String str = "Hello Flutter";
  String msg = "";
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: [
          PopupMenuButton(
              onSelected: (val) {
                print('Selected value is ${val}');
                popValue = val;
                print(popValue);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Row(children: [
                          Icon(Icons.home),
                          Text('home'),
                        ])),
                    PopupMenuItem(
                        value: 2,
                        child: Row(children: [
                          Icon(Icons.account_tree_outlined),
                          Text('Profile'),
                        ])),
                    PopupMenuItem(
                        value: 3,
                        child: Row(children: [
                          Icon(Icons.settings),
                          Text('Settings'),
                        ]))
                  ])
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: devWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: devHeight * 0.02),
              Text(
                'hello world',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              RichText(
                  text: TextSpan(
                      text: ' Hello ',
                      style: GoogleFonts.abrilFatface(
                          color: Colors.green, fontSize: 30),
                      children: [
                    TextSpan(
                      text: ' Flutter ',
                      style: GoogleFonts.poppins(
                          color: Colors.green, fontSize: 30),
                    ),
                    TextSpan(
                        text: ' World ', style: TextStyle(color: Colors.green)),
                    TextSpan(
                        text: '  Dart ', style: TextStyle(color: Colors.red))
                  ])),
              Icon(Icons.access_alarm_rounded, size: 30, color: Colors.green),
              // From Asset
              Container(
                  color: Colors.blueAccent,
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/nature.jpg', fit: BoxFit.cover)),
              // From network
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUPIfiGgUML8G3ZqsNLHfaCnZK3I5g4tJabQ&s')),
                  color: Colors.blueAccent,
                  // shape: BoxShape.circle
                ),
                child: Text('Hello image'),
              ),
              ListTile(
                onLongPress: () {
                  print('Long Pressed');
                },
                onTap: () async {
                  print('tapped');
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Sample3(str: str)));

                  if (result != null) {
                    print('Result is $result');
                    setState(() {
                      msg = result;
                    });
                  } else {
                    print(result);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.grey.shade300,
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/nature.jpg'),
                ),
                trailing: Icon(Icons.chat),
                title: Text('This is the title'),
                subtitle: Text('This is the description'),
              ),
              // Example for card
              Card(
                elevation: 10,
                color: Colors.grey.shade300,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text('Card Title'),
                    Text('Card Description'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 150, child: Image.asset('assets/nature.jpg')),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
