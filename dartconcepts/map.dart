void main() {
  Map<String, int> map = {'one': 1, 'two': 2, 'three': 3};

  // print(map['two']);
  // print(map.length);
  // print(map.isEmpty);
  // print(map.isNotEmpty);
  // print(map.keys);
  // print(map.values);

  map['four'] = 4;
  map.addAll({'five': 5, 'six': 6});
  // map.clear();
  // map['six'] = 7;
  // print(map);
  // print(map);
  // print(map.containsKey('six'));
  // map
  // print(map.containsValue(10));
  // map.forEach((key, value) => print('key is $key and value is $value'));
  map.remove('six');
  print(map);
}
