import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:healthylist/pages/forgot_pw.dart';
import 'package:line_icons/line_icons.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                //---------------- Header ----------------------
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

                //---------------- Header ----------------------

                //---------------- Login ----------------------

                Text(
                  "เข้าสู่ระบบ",
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

                //---------------- Login ----------------------

                //---------------- Email-Field ----------------------
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
                            LineIcons.envelope,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
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
                //---------------- Email-Field ----------------------

                //---------------- Password-Field ----------------------
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
                            LineIcons.lock,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: TextField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //---------------- Password-Field ----------------------
                SizedBox(
                  height: 13,
                ),
                //---------------- Forgot Password-Field ----------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ForgotpasswordPage();
                          }));
                        },
                        child: Text(
                          "ลืมรหัสผ่าน?",
                          style: GoogleFonts.getFont('Poppins',
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: fourthColor),
                        ),
                      ),
                    ],
                  ),
                ),
                //---------------- Forgot Password-Field ----------------------

                SizedBox(
                  height: 155,
                ),

                //---------------- Sign in Button ----------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: [secondary, primary]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.arrowRight,
                              color: white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.5, left: 7.0),
                              child: Text("เข้าสู่ระบบ",
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

                //---------------- Register Button ----------------------
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
                //---------------- Register Button ----------------------

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
                  height: 15,
                ),

                //Register
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Row(
                    children: [
                      Text('ไม่ใช่สมาชิก?'),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: Text(
                          ' สมัครสมาชิก',
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
