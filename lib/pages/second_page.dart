import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthylist/auth/chart.dart';
import 'package:healthylist/pages/homepage.dart';
import 'package:healthylist/pages/setting.dart';
import 'package:healthylist/pages/video_page.dart';

import '../colors/colors.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
            context, MaterialPageRoute(builder: (context) => SettingPage()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //----------------------------------------------Header---------------------------------------------
    return Scaffold(
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
                        'ติดตามการออกกำลังกาย',
                        style: GoogleFonts.getFont('Poppins',
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // --------------------------------- Graph ---------------------------------
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: white.withOpacity(0.05),
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 10)),
                    ],
                    borderRadius: BorderRadius.circular(0)),
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    minY: 0,
                    maxX: 7,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            const FlSpot(0, 3),
                            const FlSpot(2.6, 2),
                            const FlSpot(3.9, 5),
                            const FlSpot(5, 3.1),
                            const FlSpot(5.6, 4),
                            const FlSpot(6, 3),
                            const FlSpot(7, 4),
                          ],
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [thirdColor, secondary],
                          ),
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                thirdColor.withOpacity(0.3),
                                secondary.withOpacity(0.3)
                              ],
                            ),
                          ),
                          dotData: FlDotData(show: false)),
                    ],
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: false,
                      drawVerticalLine: false,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: black,
                          strokeWidth: 0.8,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          getTitlesWidget: ((value, meta) {
                            String text = "";
                            switch (value.toInt()) {
                              case 1:
                                text = "0%";
                                break;
                              case 2:
                                text = "20";
                                break;
                              case 3:
                                text = "40";
                                break;
                              case 4:
                                text = "60";
                                break;
                              case 5:
                                text = "80";
                                break;
                              case 6:
                                text = "100";
                                break;
                              default:
                                return Container();
                            }
                            return Text(
                              text,
                              style: GoogleFonts.getFont(
                                "Poppins",
                                color: black,
                                fontSize: 11,
                              ),
                            );
                          }),
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          getTitlesWidget: ((value, meta) {
                            String text = "";
                            switch (value.toInt()) {
                              case 1:
                                text = "จ.";
                                break;
                              case 2:
                                text = "อ.";
                                break;
                              case 3:
                                text = "พ.";
                                break;
                              case 4:
                                text = "พฤ.";
                                break;
                              case 5:
                                text = "ศ.";
                                break;
                              case 6:
                                text = "ส.";
                                break;
                              case 7:
                                text = "อา.";
                                break;
                              default:
                                return Container();
                            }
                            return Text(
                              text,
                              style: GoogleFonts.getFont(
                                "Poppins",
                                color: black,
                                fontSize: 11,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // --------------------------------- Graph ---------------------------------
              //----------------------------------------------BMI---------------------------------------------
              SizedBox(
                height: 20,
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
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: white),
                              ),
                              SizedBox(
                                height: 18,
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
                                    "ดูเพิ่มเติม",
                                    style: GoogleFonts.getFont('Poppins',
                                        fontSize: 13, color: white),
                                  ),
                                ),
                              ),
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
                          //----------------------------------------------BMI---------------------------------------------
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "คุณต้องการฝึกอะไร",
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // การออกำลังกาย 1
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Skipping.png'))),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: Container(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การออกกำลังกายทั้งตัว",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "  11 ท่าออกกำลังกาย | 32 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "ดูเพิ่มเติม",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontSize: 14,
                                      color: secondary,
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
              ),
              SizedBox(
                height: 25,
              ),
              //ออกกำลังกาย 2
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Dumbbell.png'))),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: Container(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ออกกำลังกายเฉพาะช่วงล่าง",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "  12 ท่าออกกำลังกาย | 40 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "ดูเพิ่มเติม",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontSize: 14,
                                      color: secondary,
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
              ),
              SizedBox(
                height: 25,
              ),
              //ออกกำลังกาย 3
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Situp.png'))),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: Container(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การออกกำลังกายหน้าท้อง",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "  12 ท่าออกกำลังกาย | 40 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoplayerPage()));
                                    },
                                    child: Text(
                                      "ดูเพิ่มเติม",
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontSize: 14,
                                        color: secondary,
                                      ),
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
              ),
              SizedBox(
                height: 25,
              ),
              //การออกกำลังกาย 4
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Cardio.png'))),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: Container(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ออกกำลังกายแบบคาร์ดิโอ",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "  6 ท่าออกกำลังกาย | 20 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "ดูเพิ่มเติม",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontSize: 14,
                                      color: secondary,
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
              ),
              SizedBox(
                height: 25,
              ),
              //การออกกำลังกาย 4
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: secondary.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/Stretching.png'))),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: Container(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "การยืดเหยียดกล้ามเนื้อ",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: black),
                              ),
                              Text(
                                "  8 ท่าออกกำลังกาย | 12 นาที",
                                style: GoogleFonts.getFont('Poppins',
                                    fontSize: 12,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "ดูเพิ่มเติม",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontSize: 14,
                                      color: secondary,
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
              ),
              // ----------------------------------------------  Bottom Navigation Bar ----------------------------------------------
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
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
            iconColor: thirdColor,
          ),
          GButton(icon: Icons.favorite),
          GButton(
            icon: Icons.person,
            onPressed: () => _navigateToPage(3),
          ),
        ],
      ),
    );
  }
}
