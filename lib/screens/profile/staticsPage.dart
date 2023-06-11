import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/profile/lineChart_n1.dart';
import 'package:flutter/material.dart';

import 'appBarCommon.dart';
import 'lineChart_n2.dart';

// List<Color> lineColor = [
//   Color(0xfff3f169),
// ];

// List<LineChartBarData> lineChartBarData = [
//   LineChartBarData(
//     // color: lineColor,
//     color: Color(0xfff3f169),
//     isCurved: true,
//     spots: [
//       FlSpot(1, 8),
//       FlSpot(2, 12.4),
//       FlSpot(3, 10.8),
//       FlSpot(4, 9),
//       FlSpot(5, 8),
//       FlSpot(6, 8.6),
//       FlSpot(7, 10)
//     ],
//   )
// ];

class StaticsPage extends StatefulWidget {
  const StaticsPage({super.key});

  @override
  State<StaticsPage> createState() => _StaticsPageState();
}

class _StaticsPageState extends State<StaticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
      backgroundColor: whitef4,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            txtStatics(),
            lineChartn1(),
            lineChartn2(),
            // LineChart_n1(),
          ],
        ),
      ),
    );
  }

  Container lineChartn2() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLaikov(),
                LineChart_n2(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container lineChartn1() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textIstorya(),
                LineChart_n1(),
                // LineChart(
                //   LineChartData(
                //     borderData: FlBorderData(
                //         border: Border.all(color: Colors.white, width: 0.5)),
                //     gridData: FlGridData(
                //       drawHorizontalLine: false,
                //     ),
                //     titlesData: FlTitlesData(
                //       bottomTitles: AxisTitles(
                //         sideTitles: SideTitles(
                //           showTitles: true,
                //           // getTextStyles: (value) => TextStyle(
                //           // color: Colors.white,
                //           // fontSize: 12,
                //           // fontWeight: FontWeight.bold),
                //           getTitlesWidget: (double, value) {
                //             switch (double.toInt()) {
                //               case 1:
                //                 return 'Mon';
                //               case 2:
                //                 return 'Tues';
                //               case 3:
                //                 return 'Wed';
                //               case 4:
                //                 return 'Thu';
                //               case 5:
                //                 return 'Fri';
                //               case 6:
                //                 return 'Sat';
                //               case 7:
                //                 return 'Sun';
                //             }
                //             return '';
                //           },
                //         ),
                //         leftTitles: SideTitles(
                //           interval: 4,
                //           showTitles: true,
                //           getTextStyles: (value) => TextStyle(
                //               color: Colors.white,
                //               fontSize: 14,
                //               fontWeight: FontWeight.bold),
                //           getTitles: (value) {
                //             if (value.toInt() == 0)
                //               return '';
                //             else
                //               return value.toInt().toString();
                //           },
                //         ),
                //       ),
                //       minX: 1,
                //       minY: 0,
                //       maxX: 7,
                //       maxY: 16,
                //       lineBarsData: lineChartBarData,
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }

  RichText textLaikov() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'История лайков за ',
              // style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w600,
              //   color: black33,
              // ),
              style: ts33_16_600_1),
          TextSpan(
              text: '7 дней',
              // style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w400,
              //   color: black33,
              // ),
              style: ts33_16_400_1),
        ],
      ),
    );
  }

  RichText textIstorya() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'История просмотров за ',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   color: black33,
            // ),
            style: ts33_16_600_1,
          ),
          TextSpan(
            text: '7 дней',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w400,
            //   color: black33,
            // ),
            style: ts33_16_400_1,
          ),
        ],
      ),
    );
  }

  Widget txtStatics() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 0),
      child: Text(
        'Статистика',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.5,
        //   color: black11,
        //   fontFamily: 'Gilroy',
        // ),
        style: ts11_20_600_05,
      ),
    );
  }
}
