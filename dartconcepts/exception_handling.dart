void main() {
  try {
    // String? str;
    // print(str);
    int num = 0;
    checkForNonZero(num);
  } catch (e) {
    print(e);
  } finally {
    print('Thank you for coming');
  }
}

checkForNonZero(int num) {
  if (num == 0) {
    throw Exception("Number cannot be zero");
  } else {
    print('good to go');
  }
}
