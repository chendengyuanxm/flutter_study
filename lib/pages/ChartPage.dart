import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartPage'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              lineChart(),
              barChart(),
              pieChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineChart() {
    return Container(
      width: 400,
      height: 300,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 5,
              colors: [Colors.teal],
              isStrokeCapRound: false,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
              ),
              spots: [
                FlSpot(1, 1),
                FlSpot(3, 1.5),
                FlSpot(5, 1.4),
                FlSpot(7, 3.4),
                FlSpot(10, 2),
                FlSpot(12, 2.2),
                FlSpot(13, 1.8),
              ],
            ),
          ],
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.green.withOpacity(0.8),
            ),
          ),
          gridData: FlGridData(
            drawVerticalLine: true,
          ),
          titlesData: FlTitlesData(
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(
              showTitles: true,
              getTitles: (value) => '${value}m'
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                switch(value.toInt()) {
                  case 2:
                    return 'SEPT';
                  case 7:
                    return 'OCT';
                  case 12:
                    return 'DEC';
                }
                return '';
              },
            ),
          ),
          borderData: FlBorderData(
            border: Border(
              bottom: BorderSide(color: Colors.red, width: 4),
            ),
          ),
          minX: 0,
          maxX: 14,
          maxY: 4,
          minY: 0,
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [Color(0xff53fdd7)],
        width: 5,
      ),
      BarChartRodData(
        y: y2,
        colors: [Color(0xffff5182)],
        width: 5,
      ),
    ]);
  }

  Widget barChart() {
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: BarChart(
        BarChartData(
          maxY: 20,
          barGroups: items,
        ),
      ),
    );
  }

  Widget pieChart() {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sections: List.generate(4, (index) => PieChartSectionData(
            color: Colors.accents[index],
            value: (10*(index+1)).toDouble(),
            title: '${(index+1)*10}%',
            radius: 80,
          )),
        ),
      ),
    );
  }
}
