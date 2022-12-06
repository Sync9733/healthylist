import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthylist/auth/auth_page.dart';
import 'package:healthylist/auth/main_page.dart';
import 'package:healthylist/pages/login.dart';
import '../colors/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              // Header
              Image.asset(
                'images/heart_logo.png',
                width: 250,
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                "Healthy List",
                style: GoogleFonts.getFont(
                  'Poppins',
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                "ใครก็สามารถสุขภาพดีได้",
                style: GoogleFonts.getFont(
                  'Poppins',
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

              SizedBox(
                height: 195,
              ),

              //Start
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [secondary, primary]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "เริ่มต้นใช้งาน",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
