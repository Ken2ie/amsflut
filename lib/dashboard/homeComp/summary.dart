import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../api_services/ti.dart';
import '../../api_services/timetableModel.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
      height: 200,
      child:
          BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                ),
                gridData: FlGridData(show: false),
                barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(toY: 10, width: 15, color: Colors.amber),
                ]),
                ]
              ),
                )
          )
        // )
      ],
    );
  
  }
  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Jan';
          break;
        case 2:
          text = 'Mar';
          break;
        case 4:
          text = 'May';
          break;
        case 6:
          text = 'Jul';
          break;
        case 8:
          text = 'Sep';
          break;
        case 10:
          text = 'Nov';
          break;
      }

      return Text(text);
    },
  );
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: Colors.black,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: Colors.amber,
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];