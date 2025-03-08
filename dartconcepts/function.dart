void main() {
  print(getName(20, "Sheik", firstName: '', lastName: '', middelName: ''));
}

void name() {}

String getName(
  int age,
  String a, {
  required String firstName,
  required String lastName,
  required String middelName,
}) =>
    firstName + lastName;


// String 

