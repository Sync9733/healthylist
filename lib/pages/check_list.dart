import 'package:flutter/material.dart';
import 'package:healthylist/auth/graph.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthylist/colors/colors.dart';
import 'package:line_icons/line_icons.dart';

class TodayTarget extends StatefulWidget {
  const TodayTarget({Key? key}) : super(key: key);

  @override
  _TodayTarget createState() => _TodayTarget();
}

class _TodayTarget extends State<TodayTarget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "ติดตามการออกกำลังกาย",
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: black),
            ),
            IconButton(
                onPressed: () {},
                icon: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Icon(
                      LineIcons.bars,
                      size: 22,
                      color: black.withOpacity(0.3),
                    ),
                  ),
                ))
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "เป้าหมายวันนี้",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: [secondary, primary]),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("images/glass.svg"),
                                Text(
                                  "น้ำดื่ม",
                                  style: TextStyle(fontSize: 13, color: black),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("images/foot_step.svg"),
                                Text(
                                  "จำนวนก้าว",
                                  style: TextStyle(fontSize: 13, color: black),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
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
                  "ความคืบหน้าของกิจกรรม",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                Container(
                  width: 95,
                  height: 35,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [secondary, primary]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "สัปดาห์",
                        style: TextStyle(fontSize: 13, color: white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: white,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 20,
                        blurRadius: 10,
                        color: black.withOpacity(0.01),
                        offset: Offset(0, 1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekly.length, (index) {
                    return Column(
                      children: [
                        Flexible(
                          child: Stack(
                            children: [
                              Container(
                                width: 20,
                                height: size.height,
                                decoration: BoxDecoration(
                                    color: bgTextField,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 20,
                                  height:
                                      size.height * (weekly[index]['count']),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: weekly[index]['color']),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weekly[index]['day'],
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    );
                  }),
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
                  "กิจกรรมที่ทำล่าสุด",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(latestActivityJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.01),
                              spreadRadius: 20,
                              blurRadius: 10,
                              offset: Offset(0, 1)),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            latestActivityJson[index]['img']))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 55,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      latestActivityJson[index]['title'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      latestActivityJson[index]['time_ago'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: black.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
