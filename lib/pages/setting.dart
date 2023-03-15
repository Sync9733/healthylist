import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthylist/pages/profile.dart';
import 'package:healthylist/pages/second_page.dart';
import 'package:line_icons/line_icons.dart';

import '../colors/colors.dart';
import 'homepage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final user = FirebaseAuth.instance.currentUser!;
  int _selectedIndex = 0;
  void _navigateToPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingPage()));
        break;
    }
  }

  List<String> docsIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docsIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('images/people2.png'))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Nets",
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: 14, fontWeight: FontWeight.w500, color: black),
                ),
                Text(
                  user.email!,
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: 12, color: black.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Container(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: black.withOpacity(0.15),
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '180CM',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: secondary),
                          ),
                          Text(
                            'Height',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: black.withOpacity(0.15),
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '  65kg  ',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: secondary),
                          ),
                          Text(
                            'Weight',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: black.withOpacity(0.15),
                              offset: Offset(0, 1))
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '    22    ',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: secondary),
                          ),
                          Text(
                            'Age',
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetupProfile()));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: black.withOpacity(0.15),
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 15,
                        ),
                        Text('ตั้งค่า'),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: black.withOpacity(0.15),
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(
                        width: 15,
                      ),
                      Text('ข้อมูลส่วนตัว'),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: black.withOpacity(0.15),
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.bell),
                      SizedBox(
                        width: 15,
                      ),
                      Text('การแจ้งเตือน'),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: black.withOpacity(0.15),
                      offset: Offset(0, 1))
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.phone),
                      SizedBox(
                        width: 15,
                      ),
                      Text('ติดต่อเรา'),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: black.withOpacity(0.15),
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'ล็อคเอาท์',
                          style: GoogleFonts.getFont("Poppins",
                              color: white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      LineIcons.alternateSignOut,
                      color: white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // ------------------------------------ Bottom Navigation Bar ------------------------------------

      bottomNavigationBar: GNav(
        gap: 8,
        padding: EdgeInsets.all(16),
        tabs: [
          GButton(
            icon: Icons.home,
            onPressed: () => _navigateToPage(0),
          ),
          GButton(
            icon: Icons.search,
            onPressed: () => _navigateToPage(1),
          ),
          GButton(
            icon: Icons.favorite,
            onPressed: () => _navigateToPage(2),
          ),
          GButton(
            icon: Icons.person,
            iconColor: thirdColor,
            onPressed: () => _navigateToPage(3),
          ),
        ],
      ),
    );
  }
}
