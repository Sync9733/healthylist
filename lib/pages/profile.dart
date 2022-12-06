import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:healthylist/pages/login.dart';
import 'package:healthylist/pages/welcome.dart';
import 'package:line_icons/line_icons.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({super.key});

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    //findDisplayName();
  }

  //Future<void> findDisplayName() async {

  //FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //User firebaseUser = await firebaseAuth.currentUser();
  //setState(() {
  //login = firebaseUser.displayName;
  //});
  //print('login = $login');
  //}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // ------------------------------------ Appbar ------------------------------------
      appBar: AppBar(
        backgroundColor: secondary,
        title: Text(
          user.email!,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: Icon(LineIcons.alternateSignOut),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      // ------------------------------------ Welcome ------------------------------------\
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ยินดีต้อนรับ',
                        style: GoogleFonts.getFont('Poppins', fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'ชื่อผู้ใช้งาน',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.02),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Icon(LineIcons.bell),
                    ),
                  )
                ],
              ),
              // ------------------------------------ BMI ------------------------------------
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [secondary, primary],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: (size.width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BMI (Body Massive Index)',
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'คุณมีน้ำหนักอยู่ในเกณฑ์ปกติ',
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: white),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Container(
                                width: 95,
                                height: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [fourthColor, thirdColor]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'ดูเพิ่มเติม',
                                    style: GoogleFonts.getFont('Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [fourthColor, thirdColor],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '20.3',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ------------------------------------ Today Target ------------------------------------
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'เป้าหมายวันนี้',
                        style: GoogleFonts.getFont('Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: black),
                      ),
                      Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: [secondary, primary]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'ตรวจสอบ',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 12, color: white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ------------------------------------ Lastest workout ------------------------------------
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "การออกกำลังกายล่าสุด",
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  Text(
                    "ดูเพิ่มเติม",
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 13, color: black.withOpacity(0.5)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // ------------------------------------ Full body workout ------------------------------------
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/workout_1.png'))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 62,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การออกกำลังกายทั้งตัว",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "180 Calories Burn | 32 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgTextField),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          colors: [thirdColor, primary],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: fourthColor),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 11,
                            color: thirdColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              // ------------------------------------ Lower body workout ------------------------------------
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/workout_2.png'))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 62,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การออกกำลังกายเฉพาะช่วงล่าง",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "200 Calories Burn | 40 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgTextField),
                                  ),
                                  Container(
                                    width: size.width * 0.3,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          colors: [thirdColor, primary],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: fourthColor),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 11,
                            color: thirdColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              // ------------------------------------ AB workout ------------------------------------
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/workout_3.png'))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Container(
                          height: 62,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การออกกำลังกายหน้าท้อง",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "180 Calories Burn | 20 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgTextField),
                                  ),
                                  Container(
                                    width: size.width * 0.15,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: LinearGradient(
                                          colors: [thirdColor, primary],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      // ------------------------------------ ปุ่มกดเล่น ------------------------------------
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()));
                        },
                        // ------------------------------------ ปุ่มกดเล่น ------------------------------------
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: fourthColor),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 11,
                              color: thirdColor,
                            ),
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
      )),
      // ------------------------------------ Bottom Navigation Bar ------------------------------------

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: white,
        color: secondary,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          print(index);
        },
        items: [
          Icon(
            LineIcons.home,
            color: white,
            size: 30,
          ),
          Icon(
            LineIcons.dumbbell,
            color: white,
            size: 30,
          ),
          Icon(
            LineIcons.map,
            color: white,
            size: 30,
          ),
          Icon(
            LineIcons.user,
            color: white,
            size: 30,
          ),
        ],
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