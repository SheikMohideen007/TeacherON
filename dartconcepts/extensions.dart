void main() {
  String str = "helloworld";
  print(str.toFirstLetterUpper());
}

extension StringExtension on String {
  String toFirstLetterUpper() {
    return this[0].toUpperCase() + this.substring(1);
  }
  //  String toFirstLetterUpper() {
  //   return this[0].toUpperCase() + this.substring(1);
  // }
  //  String toFirstLetterUpper() {
  //   return this[0].toUpperCase() + this.substring(1);
  // }
  //  String toFirstLetterUpper() {
  //   return this[0].toUpperCase() + this.substring(1);
  // }
  //  String toFirstLetterUpper() {
  //   return this[0].toUpperCase() + this.substring(1);
  // }
  //  String toFirstLetterUpper() {
  //   return this[0].toUpperCase() + this.substring(1);
  // }
}
