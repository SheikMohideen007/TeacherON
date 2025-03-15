import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/sample5.dart';

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
  final formkey = GlobalKey<FormState>();
  String selectedValue = "Male";
  String defaultValue = "- Select Profession -";
  List profession = [
    "- Select Profession -",
    "Software Developer",
    "Software Tester",
    "UI/UX",
    "Devops",
    "Support"
  ];
  bool swicthvalue = false;
  List<bool> checkBox = [false, false, false, false];
  double sliderval = 30;
  final ImagePicker picker = ImagePicker();
  File? image;

  /*
  Textfield
  textFormField
  DropDownMenuButton
  radio
  checkbox
  Switch
  Slider
  Imagepicker
  showmodalbottom sheet
  */

  getFromGallery() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  getFromCamera() async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

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
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                tfield(
                    title: "Email",
                    label: "Enter your email",
                    controller: email),
                SizedBox(height: devHeight * 0.02),
                // tfield(
                //     title: "Phone",
                //     label: "Enter your phone number",
                //     controller: phone),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the phone";
                        } else if (value.length != 10) {
                          return "phone no should be 10 char long";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.green,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ],
                ),

                SizedBox(height: devHeight * 0.02),
                tfield(
                    title: "Password",
                    label: "Enter your password",
                    controller: password),
                SizedBox(height: devHeight * 0.02),
                SizedBox(
                  width: devWidth * 0.6,
                  child: DropdownButton(
                      isExpanded: true,
                      value: defaultValue,
                      items: profession.map((item) {
                        return DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                // Icon(Icons.abc),
                                Text(item),
                              ],
                            ));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          defaultValue = value as String;
                        });
                      }),
                ),
                SizedBox(height: devHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "Male",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            }),
                        Text('Male'),
                      ],
                    ),
                    SizedBox(width: devWidth * 0.02),
                    Row(
                      children: [
                        Radio(
                            // toggleable: false,
                            value: "Female",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            }),
                        Text('Female'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: devHeight * 0.02),
                Text('Select Education'),

                CheckboxListTile(
                    title: Text('SSLC'),
                    value: checkBox[0],
                    onChanged: (value) {
                      setState(() {
                        checkBox[0] = value!;
                        if (checkBox[0]) {
                          checkBox[3] = false;
                        }
                      });
                    }),
                CheckboxListTile(
                    title: Text('UG'),
                    value: checkBox[1],
                    onChanged: (value) {
                      setState(() {
                        checkBox[1] = value!;
                        if (checkBox[1]) {
                          checkBox[3] = false;
                        }
                      });
                    }),
                CheckboxListTile(
                    title: Text('PG'),
                    value: checkBox[2],
                    onChanged: (value) {
                      setState(() {
                        checkBox[2] = value!;
                        if (checkBox[2]) {
                          checkBox[3] = false;
                        }
                      });
                    }),
                CheckboxListTile(
                    activeColor: Colors.green,
                    title: Text('None of the above'),
                    value: checkBox[3],
                    onChanged: (value) {
                      setState(() {
                        for (int i = 0; i < checkBox.length - 1; i++) {
                          checkBox[i] = false;
                        }
                        checkBox[3] = value!;
                      });
                    }),
                SwitchListTile(
                    activeColor: Colors.green,
                    activeThumbImage: AssetImage('assets/nature.jpg'),
                    title: Text('Toggle Dark Mode'),
                    value: swicthvalue,
                    onChanged: (val) {
                      setState(() {
                        swicthvalue = val;
                      });
                    }),
                Text(sliderval.toString().split(".")[0]),
                Slider.adaptive(
                    label: sliderval.toString().split(".")[0],
                    min: 0,
                    max: 100,
                    value: sliderval,
                    onChanged: (val) {
                      setState(() {
                        sliderval = val;
                      });
                    }),
                SizedBox(height: devHeight * 0.02),

                SizedBox(
                    height: 200,
                    width: 200,
                    child: image == null
                        ? Image.asset('assets/nature.jpg', fit: BoxFit.cover)
                        : Image.file(image!)),

                OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                height: 100,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          getFromCamera();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.camera),
                                            SizedBox(width: 30),
                                            Text('Select Image from Camera')
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          getFromGallery();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.photo_sharp),
                                            SizedBox(width: 30),
                                            Text('Select Image from Gallery')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Text('Upload pic')),
                SizedBox(height: devHeight * 0.02),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sample5()));
                      // if (defaultValue == "- Select Profession -") {
                      //   Fluttertoast.showToast(msg: 'Select profession');
                      // }
                      // if (formkey.currentState!.validate()) {
                      //   print('Validated successfully');
                      // }

                      // if (password.text.trim().isNotEmpty &&
                      //     phone.text.trim().isNotEmpty &&
                      //     email.text.trim().isNotEmpty) {
                      //   if (phone.text.length == 10) {
                      //     Fluttertoast.showToast(msg: "Login Successfully");
                      //   } else {
                      //     Fluttertoast.showToast(msg: "Ph.no Length Should be 10");
                      //   }
                      // } else {
                      //   Fluttertoast.showToast(msg: "All Fields are required");
                      // }
                    },
                    child: Text('Login'))
              ],
            ),
          ),
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
