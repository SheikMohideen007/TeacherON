import 'package:flutter/material.dart';

class Sample7 extends StatefulWidget {
  const Sample7({super.key});

  @override
  State<Sample7> createState() => _Sample7State();
}

class _Sample7State extends State<Sample7> {
  /*
  Listview sepearted
  Lazy loading 
  */
  double devHeight = 0.0, devWidth = 0.0;
  List<String> items = List.generate(20, (index) => "Item Count : $index");
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await Future.delayed(Duration(seconds: 3), () {
          List<String> newItems =
              List.generate(10, (index) => "Item count : $index");
          setState(() {
            items.addAll(newItems);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple,
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            controller: scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (index < items.length - 1) {
                return ListTile(
                  title: Text(items[index]),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
