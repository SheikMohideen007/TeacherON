void main() {
  // String? str;
  // str = "Flutter";
  // print(str);

  List<int> list = [1, 2, 3, 4, 5];
  int len = list.length;

  // print(list.isEmpty);
  // print(list.isNotEmpty);
  // print(list.first);
  // print(list.last);
  // print(list);
  // print(list.reversed.toList());

  // list.add(10);
  // list.addAll([12, 2, 45]);
  // print(list);
  list.insert(2, 22);
  print(list);
  // list.remove(22);
  list.removeAt(2);
  print(list);

  print(list.contains(2));
  // list.clear();
  // print(list);

  print(list.indexOf(5));

  List list2 = list.sublist(0, 4);
  print(list2);

  List list3 = [30, 2, 3, 1, 10];
  list3.sort();
  print(list3);

  print(list3.map((item) => item * 10).toList());

  print(list3.where((item) => item % 2 == 0).toList());
}
