import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sample4 extends StatefulWidget {
  const Sample4({super.key});

  @override
  State<Sample4> createState() => _Sample4State();
}

class _Sample4State extends State<Sample4> {
  double devHeight = 0.0, devWidth = 0.0;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  /*
  Textfield
  */
  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: devWidth * 0.05, vertical: devHeight * 0.02),
        child: Column(
          children: [
            tfield(
                title: "Email", label: "Enter your email", controller: email),
            SizedBox(height: devHeight * 0.02),
            tfield(
                title: "Phone",
                label: "Enter your phone number",
                controller: phone),
            SizedBox(height: devHeight * 0.02),
            tfield(
                title: "Password",
                label: "Enter your password",
                controller: password),
            ElevatedButton(
                onPressed: () {
                  if (password.text.trim().isNotEmpty &&
                      phone.text.trim().isNotEmpty &&
                      email.text.trim().isNotEmpty) {
                    if (phone.text.length == 10) {
                      Fluttertoast.showToast(msg: "Login Successfully");
                    } else {
                      Fluttertoast.showToast(msg: "Ph.no Length Should be 10");
                    }
                  } else {
                    Fluttertoast.showToast(msg: "All Fields are required");
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  Column tfield(
      {required String title,
      required String label,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 10),
        TextField(
          // onChanged: (value) {
          //   print(value);
          // },
          // onSubmitted: (val) {
          //   print('Submitted');
          // },
          keyboardType: title == "Email"
              ? TextInputType.emailAddress
              : title == "Phone"
                  ? TextInputType.phone
                  : TextInputType.visiblePassword,
          maxLength: 40,
          controller: controller,
          decoration: InputDecoration(
            // hintText: "Enter a Email",
            labelText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.green)),
          ),
        )
      ],
    );
  }
}
