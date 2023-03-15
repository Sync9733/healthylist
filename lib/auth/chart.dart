import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthylist/colors/colors.dart';

class workoutProgressData extends StatefulWidget {
  const workoutProgressData({super.key});

  @override
  State<workoutProgressData> createState() => _workoutProgressDataState();
}

class _workoutProgressDataState extends State<workoutProgressData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: LineChart(LineChartData(
          minX: 0,
          minY: 0,
          maxX: 10,
          maxY: 10,
          backgroundColor: black,
          lineBarsData: [
            LineChartBarData(spots: [
              const FlSpot(0, 3),
              const FlSpot(2.6, 2),
              const FlSpot(4.9, 5),
              const FlSpot(6.8, 3.1),
              const FlSpot(8, 4),
              const FlSpot(9.5, 3),
              const FlSpot(11, 4),
            ])
          ])),
    );
  }
}
