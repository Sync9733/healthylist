import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final user = FirebaseAuth.instance.currentUser!;
  final _userNameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  String imageUrl = " ";

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 75,
      maxHeight: 75,
      imageQuality: 75,
    );

    Reference ref = FirebaseStorage.instance.ref().child('profilepic.jpg');

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        imageUrl = value;
      });
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future signUp() async {
    // autenticate user
    // create user
    try {
      //update user details
      updateUserDetails(
          _userNameController.text.trim(),
          int.parse(_weightController.text.trim()),
          int.parse(_heightController.text.trim()));
      //Show Error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Success'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Future updateUserDetails(String userName, int weight, int height) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'user name': userName, 'weight': weight, 'height': height});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // ------------------------------------ Appbar ------------------------------------
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Icon(
                      LineIcons.arrowLeft,
                      size: 22,
                      color: black.withOpacity(0.3),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 135.0),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: black),
              ),
            ),
          ],
        ),
      ),
      // ------------------------------------ Profile ------------------------------------\
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 7.5,
          ),
          SingleChildScrollView(
            child: Container(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickUploadImage();
                        },
                        child: imageUrl == " "
                            ? Icon(
                                Icons.person,
                                size: 80,
                                color: black.withOpacity(0.2),
                              )
                            : Image.network(imageUrl),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ชื่อผู้ใช้งาน",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                user.email!,
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ------------------------------------ Height ------------------------------------\
          SingleChildScrollView(
            child: Container(
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 67.0),
                    child: Row(
                      children: [
                        Container(
                          width: 85,
                          height: 65,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 10))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, top: 14),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "180cm",
                                          style: GoogleFonts.getFont('Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: secondary),
                                        ),
                                        Text(
                                          "Height",
                                          style: GoogleFonts.getFont('Poppins',
                                              fontSize: 12,
                                              color: black.withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        // ------------------------------------ Weight ------------------------------------\
                        Container(
                          width: 85,
                          height: 65,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: Offset(0, 10))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, top: 14),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "90kg",
                                          style: GoogleFonts.getFont('Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: secondary),
                                        ),
                                        Text(
                                          "Weight",
                                          style: GoogleFonts.getFont('Poppins',
                                              fontSize: 12,
                                              color: black.withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),
          // ------------------------------------ username ------------------------------------\
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      LineIcons.weight,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ชื่อผู้ใช้งาน',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // ------------------------------------ น้ำหนัก ------------------------------------\
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      LineIcons.weight,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'น้ำหนัก',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          // ------------------------------------ ส่วนสูง ------------------------------------\
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: white),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      LineIcons.alternateArrowsVertical,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ส่วนสูง',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 35,
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [secondary, primary]),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Row(
                    children: [
                      Icon(
                        LineIcons.upload,
                        color: white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.5, left: 7.0),
                        child: Text("อัพเดท",
                            style: GoogleFonts.getFont('Poppins',
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

//MaterialButton(
//onPressed: () {
//FirebaseAuth.instance.signOut();
//},
//color: primary,
//child: Text('sign out'),
//),
