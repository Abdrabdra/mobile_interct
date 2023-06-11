import '../../data/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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

class LineChart_n1 extends StatefulWidget {
  const LineChart_n1({super.key});

  @override
  State<LineChart_n1> createState() => _LineChart_n1State();
}

class _LineChart_n1State extends State<LineChart_n1> {
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
              child: LineChart(
                // showAvg ? avgData() : mainData(),
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // const style = TextStyle(
    //   // color: Color(0xff68737d),
    //   color: grey87,
    //   fontWeight: FontWeight.w700,
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
      gridData: FlGridData(
        show: false,
        // drawVerticalLine: false,
        // horizontalInterval: 1,
        // verticalInterval: 1,
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: const Color(0xff37434d),
        //     strokeWidth: 1,
        //   );
        // },
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
      minX: 1,
      maxX: 7,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 7.7),
            FlSpot(2, 5),
            FlSpot(3, 4.1),
            FlSpot(4, 6.5),
            FlSpot(5, 2.8),
            FlSpot(6, 5.3),
            FlSpot(7, 4),
          ],
          isCurved: false,
          // isCurved: true,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          color: gradientColors[0].withOpacity(0.4),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            // show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.4))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
