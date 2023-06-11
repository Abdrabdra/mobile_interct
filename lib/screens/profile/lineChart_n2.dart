import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

List<Color> gradientColors = [
  // const Color(0xff23b6e6),
  // Colors.yellow,
  // const Color(0xff02d39a),
  color_green,
  color_green,
];

bool showAvg = false;
double lerp_d = 10;

class LineChart_n2 extends StatefulWidget {
  const LineChart_n2({super.key});

  @override
  State<LineChart_n2> createState() => _LineChart_n2State();
}

class _LineChart_n2State extends State<LineChart_n2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: white,
              // color: Color(0xff232d37),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                // right: 18,
                left: 12,
                top: 24,
                // bottom: 12,
              ),
              child:
                  //
                  barChart(),

              //     LineChart(
              //   // showAvg ? avgData() : mainData(),
              //   mainData(),
              // ),
            ),
          ),
        ),
      ],
    );
  }

  BarChart barChart() {
    return BarChart(
      BarChartData(
        maxY: 9,
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 5,
                width: 2,
                color: gradientColors[0].withOpacity(0.4),
                borderSide: BorderSide.none,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 3.7,
                width: 2,
                color: gradientColors[0].withOpacity(0.4),
                borderSide: BorderSide.none,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 6.5,
                width: 2,
                color: gradientColors[0].withOpacity(0.4),
                borderSide: BorderSide.none,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 7.2,
                width: 2,
                color: gradientColors[0].withOpacity(0.4),
                borderSide: BorderSide.none,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 4.2,
                width: 2,
                color: gradientColors[0].withOpacity(0.4),
                borderSide: BorderSide.none,
              ),
            ],
          ),
        ],
        borderData: FlBorderData(
          border: const Border(bottom: BorderSide(), left: BorderSide()),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              // color: const Color(0xffE5E7EB),
              color: greyc1,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: leftTitleWidgets,
              reservedSize: 42,
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  // List<BarChartGroupData> _chartGroups() {
  //   return points
  //       .map((point) => BarChartGroupData(
  //           x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
  //       .toList();
  // }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // const style = TextStyle(
    //   // color: Color(0xff68737d),
    //   color: grey87,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 16,
    // );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('MAR', style: ts87_16_700_0);
        break;
      case 5:
        text = Text('JUN', style: ts87_16_700_0);
        break;
      case 8:
        text = Text('SEP', style: ts87_16_700_0);
        break;
      default:
        text = Text('', style: ts87_16_700_0);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    // const style = TextStyle(
    //   // color: Color(0xff67727d),
    //   color: grey87,
    //   fontWeight: FontWeight.bold,
    //   fontSize: 14,
    // );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '100';
        break;
      case 2:
        text = '200';
        break;
      case 3:
        text = '300';
        break;
      case 4:
        text = '400';
        break;
      case 5:
        text = '500';
        break;
      case 6:
        text = '600';
        break;
      case 7:
        text = '700';
        break;
      case 8:
        text = '800';
        break;
      case 9:
        text = '900';
        break;
      default:
        return Container();
    }

    return Text(text, style: ts87_14_700_0, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      // backgroundColor: Color(0xffF1F2F2).withOpacity(0.4),
      backgroundColor: whitef4.withOpacity(0.4),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: 1,
        drawVerticalLine: false,
        // horizontalInterval: 1,
        // verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: const Color(0xffE5E7EB),
            color: greyc1,
            strokeWidth: 1,
          );
        },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            // showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        // show: true,
        // border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 5.7),
            FlSpot(2, 6.3),
            FlSpot(3, 4.1),
            FlSpot(4, 6.5),
            FlSpot(5, 2.8),
            FlSpot(6, 5.3),
            FlSpot(7, 4),
          ],
          isCurved: false,
          isStrokeJoinRound: false,
          // isCurved: true,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          color: gradientColors[0].withOpacity(1),
          barWidth: 3,
          isStrokeCapRound: false,
          // isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            // getDotPainter: ((p0, p1, p2, p3) {
            //   return FlDotPainter;
            // })
            // show: false,
          ),
          belowBarData: BarAreaData(
            // show: true,
            gradient: LinearGradient(
              colors:
                  gradientColors.map((color) => color.withOpacity(0)).toList(),
            ),
            show: true,
            // color: Color(0xffF1F2F2),
            // applyCutOffY: true,
            // cutOffY: 5.5,
            // gradient: LinearGradient(
            //   colors: [Colors.white.withOpacity(1)],
            //   // colors:
            //   //     gradientColors.map((color) => color.withOpacity(1)).toList(),
            // ),
            spotsLine: BarAreaSpotsLine(
              show: true,
              // applyCutOffY: true,
              flLineStyle: FlLine(
                color: color_green,
                strokeWidth: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
