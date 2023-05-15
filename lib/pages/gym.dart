import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:healthylist/pages/second_page.dart';
import 'package:healthylist/pages/setting.dart';
import 'package:line_icons/line_icons.dart';

import '../colors/colors.dart';
import 'homepage.dart';

class NearbyGym extends StatefulWidget {
  const NearbyGym({super.key});

  @override
  State<NearbyGym> createState() => _NearbyGymState();
}

class _NearbyGymState extends State<NearbyGym> {
  double latitude = 0.0;
  double longitude = 0.0;
  int _selectedIndex = 0;

  void getCurrentPosition() async {
    // Permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not given");
      // ขอ user permission
      LocationPermission asked = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
      });

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      String landmark = '';
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        landmark = placemark.subLocality ?? '';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('สถานที่'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$landmark'),
                SizedBox(height: 8),
                Text('Latitude: $latitude'),
                SizedBox(height: 8),
                Text('Longitude: $longitude'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

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
            context, MaterialPageRoute(builder: (context) => NearbyGym()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/running.png'))),
                ),
              ),
              Text(
                "สถานที่ออกกำลังกายใกล้เคียง",
                style: GoogleFonts.getFont("Poppins",
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              // ปุ่ม Get current location
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
                child: InkWell(
                  onTap: getCurrentPosition,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(
                              width: 15,
                            ),
                            Text('User locations'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // สถานที่ 1
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color: black.withOpacity(0.1),
                          offset: Offset(0, 1))
                    ],
                    color: secondary.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/Kay_gym.jpg'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kay Muaythai",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.locationArrow,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "อยู่ห่าง 500 เมตร",
                                      style: GoogleFonts.getFont('Poppins',
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(
                                      LineIcons.arrowCircleRight,
                                      color: thirdColor,
                                      size: 30,
                                    ),
                                  ],
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
              // สถานที่ 2
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color: black.withOpacity(0.1),
                          offset: Offset(0, 1))
                    ],
                    color: secondary.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/themall.jpg'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Fitness First - The mall",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.locationArrow,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "อยู่ห่าง 2.0 กม.",
                                      style: GoogleFonts.getFont('Poppins',
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      width: 47,
                                    ),
                                    Icon(
                                      LineIcons.arrowCircleRight,
                                      color: thirdColor,
                                      size: 30,
                                    ),
                                  ],
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
              // สถานที่ 5
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color: black.withOpacity(0.1),
                          offset: Offset(0, 1))
                    ],
                    color: secondary.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/monkey.jpg'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Monkey Gym",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.locationArrow,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "อยู่ห่าง 4.0 กม.",
                                      style: GoogleFonts.getFont('Poppins',
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      width: 46,
                                    ),
                                    Icon(
                                      LineIcons.arrowCircleRight,
                                      color: thirdColor,
                                      size: 30,
                                    ),
                                  ],
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
              // สถานที่ 3
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color: black.withOpacity(0.1),
                          offset: Offset(0, 1))
                    ],
                    color: secondary.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/novel.jpg'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Novel Fitness & Sauna",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.locationArrow,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "อยู่ห่าง 5.3 กม.",
                                      style: GoogleFonts.getFont('Poppins',
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      width: 47,
                                    ),
                                    Icon(
                                      LineIcons.arrowCircleRight,
                                      color: thirdColor,
                                      size: 30,
                                    ),
                                  ],
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
              // // สถานที่ 4
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color: black.withOpacity(0.1),
                          offset: Offset(0, 1))
                    ],
                    color: secondary.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/thebest.jpg'))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The Best Gym",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      LineIcons.locationArrow,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "อยู่ห่าง 5.4 กม.",
                                      style: GoogleFonts.getFont('Poppins',
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      width: 46,
                                    ),
                                    Icon(
                                      LineIcons.arrowCircleRight,
                                      color: thirdColor,
                                      size: 30,
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
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
            icon: Icons.map,
            iconColor: thirdColor,
          ),
          GButton(
            icon: Icons.person,
            onPressed: () => _navigateToPage(3),
          ),
        ],
      ),
    );
  }
}
