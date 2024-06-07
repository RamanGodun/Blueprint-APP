import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../State_management/Src/Const_data/strings_4_app.dart';
import '../../../../State_management/Helpers/Common/helpers.dart';

class BarGraph extends StatefulWidget {
  const BarGraph(
      {super.key, required this.monthlySummary, required this.startMonth, s});

  final List<double> monthlySummary;
  final int startMonth;

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  // data for each bar
  List<IndividualBar> barData = [];

  // initialization of bar data - use our monthly summary to create a list of bars
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => scrollToEnd(),
    );
    initializeBarData();
    super.initState();
  }

  void initializeBarData() {
    barData = List.generate(
      widget.monthlySummary.length,
      (index) => IndividualBar(
        x: index,
        y: widget.monthlySummary[index].toInt(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Helpers.textTheme(context);
    double barWidth = 30;
    double spaceBetweenBars = 10;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          width: barWidth * barData.length +
              spaceBetweenBars * (barData.length - 1),
          child: BarChart(
            BarChartData(
              minY: 0,
              maxY: calculateMax(),
              // BarChart  view configuring
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getTopTitles,
                  reservedSize: 27,
                )),
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) =>
                      getBottomTitles(value, meta, context, textTheme),
                  reservedSize: 28,
                )),
              ),
              barGroups: barData
                  .map(
                    (barDataItem) => BarChartGroupData(
                      x: barDataItem.x,
                      barRods: [
                        BarChartRodData(
                          toY: barDataItem.y.toDouble(),
                          width: barWidth,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(7),
                              topRight: Radius.circular(7)),
                          color: Helpers.colorScheme(context)
                              .secondary
                              .withOpacity(
                                  Helpers.isDarkTheme(context) ? 0.25 : 0.3),
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: calculateMax(),
                            color: Helpers.colorScheme(context)
                                .secondary
                                .withOpacity(0.03),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
              alignment: BarChartAlignment.center,
              groupsSpace: spaceBetweenBars,
            ),
          ),
        ),
      ),
    );
  }

  /*
Methods next
 */
  double calculateMax() {
    double max = 3000; // max for initial upper limit of graph
    List<double> sortedMonthlySummary = List.from(widget.monthlySummary);
    sortedMonthlySummary.sort();
    max = sortedMonthlySummary.last * 1.05;
    if (max < 3000) {
      return 3000;
    }
    return max;
  }

  //  controller to scroll to current (latest) month
  final ScrollController _scrollController = ScrollController();
  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  //
  Widget getTopTitles(double value, TitleMeta meta) {
    TextStyle textStyle = Helpers.textTheme(context).bodySmall!.copyWith();

    int index = value.toInt();
    String formattedNumber = index < widget.monthlySummary.length
        ? NumberFormat.compact().format(widget.monthlySummary[index])
        : '0';

    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          formattedNumber,
          style: textStyle,
        ));
  }
}

//
Widget getBottomTitles(
    double value, TitleMeta meta, BuildContext context, TextTheme textTheme) {
  const monthNames = AppStrings.monthNames;
  int differenceBetweenStartAndCurrentMonths = DateTime.now().month;
  int monthIndex =
      (value.toInt() - 1 + differenceBetweenStartAndCurrentMonths) % 12;

  if (DateTime.now().month == 2 && DateTime.now().day == 29) {
    monthIndex = (value.toInt() + differenceBetweenStartAndCurrentMonths) % 12;
  }

  String text = monthIndex >= 0 && monthIndex < monthNames.length
      ? monthNames[monthIndex]
      : '';

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      text,
      style: textTheme.bodySmall!.copyWith(),
    ),
  );
}

class IndividualBar {
  final int x;
  final int y;

  IndividualBar({
    required this.x,
    required this.y,
  });
}
