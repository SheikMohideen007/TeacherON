import 'package:flutter/material.dart';
import 'package:sample/sample6.dart';
import 'package:sample/users.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Sample5 extends StatefulWidget {
  const Sample5({super.key});

  @override
  State<Sample5> createState() {
    print('create state called');
    return _Sample5State();
  }
}

class _Sample5State extends State<Sample5> {
  @override
  void initState() {
    super.initState();
    print('init called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didchange called');
  }

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }

  /*
  ListView Builder
  LifeCycle
  Alert Dialog
  SnackBar
  */

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sample6()));
              setState(() {
                print('set state called');
              });
            },
            child: Text('Next')),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              String name =
                  '${users[index]['firstName']} ${users[index]['lastName']}';
              String age = '${users[index]['age']}';
              String profession = '${users[index]['company']['title']}';
              String image = users[index]['image'];
              String country = '${users[index]['address']['country']}';
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    SnackBar snack = SnackBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      duration: Duration(minutes: 2),
                      content: Text('Alert is closed !!!'),
                      action: SnackBarAction(label: 'ok', onPressed: () {}),
                    );
                    // Alert Dialog
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(name),
                            content: Text(profession),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snack);
                                  },
                                  child: Text('cancel')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snack);
                                  },
                                  child: Text('ok'))
                            ],
                          );
                        });
                    // SnackBar
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: index % 2 == 0
                      ? Colors.grey.shade400
                      : Colors.transparent,
                  leading: Image.network(image),
                  title: Text(name),
                  subtitle: Text(profession),
                  trailing: Column(
                    children: [
                      Text(age),
                      Text(country),
                    ],
                  ),
                ),
              );
            }));
  }
}
