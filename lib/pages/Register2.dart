import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:line_icons/line_icons.dart';

class RegisterPage2 extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage2({Key? key, required this.showLoginPage})
      : super(key: key);

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _firstNameController2 = TextEditingController();
  final _lastNameController = TextEditingController();
  final _telController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _firstNameController2.dispose();
    _lastNameController.dispose();
    _telController.dispose();
    super.dispose();
  }

  Future signUp() async {
    // autenticate user
    if (passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _firstNameController2.text.trim(),
        _telController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String firstName2,
      String tel, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'first name': firstName2,
      'tel number': tel,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                // Header
                Text(
                  "ยินดีต้อนรับ,",
                  style: GoogleFonts.getFont(
                    'Poppins',
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  "สมัครสมาชิก",
                  style: GoogleFonts.getFont(
                    'Poppins',
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //First name
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
                            LineIcons.user,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _firstNameController2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ชื่อจริง',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Weight
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
                            LineIcons.user,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _firstNameController2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ชื่อจริง',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                //Height
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
                            LineIcons.user,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _firstNameController2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ชื่อจริง',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                //DB
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
                            LineIcons.user,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _firstNameController2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ชื่อจริง',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),

                //Sign up
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: [secondary, primary]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 87.0),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.arrowRight,
                              color: white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.5, left: 7.0),
                              child: Text("สมัครสมาชิก",
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

                SizedBox(
                  height: 20,
                ),

                //Or
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("or",
                          style: GoogleFonts.getFont(
                            'Poppins',
                            color: black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //Google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: black.withOpacity(0.1))),
                      child: Center(
                        child: Image.asset(
                          "images/Google.png",
                          width: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: black.withOpacity(0.1))),
                      child: Center(
                        child: Image.asset(
                          "images/facebook.png",
                          width: 40,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                //Already Member?
                Padding(
                  padding: const EdgeInsets.only(left: 115.0),
                  child: Row(
                    children: [
                      Text('เป็นสมาชิกอยู่แล้ว?'),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          ' เข้าสู่ระบบ',
                          style: TextStyle(
                              color: fourthColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
