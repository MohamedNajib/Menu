import 'package:extensions_package/extensions_package.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/local_storage.dart';
import 'package:pos/views/landingPage/landing_controller.dart';
import 'package:pos/widget/custom_app_bar.dart';

import 'menu/widgets/menu_component_widget.dart';
import 'pageContent/pages_component_widget.dart';

class LandingPage extends GetResponsiveView<LandingController> {
  LandingPage({Key? key})
      : super(
          key: key,
          alwaysUseBuilder: false,
        );

  @override
  Widget? desktop() {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: Row(
        children: [
          MenuComponentWidget(),
          PagesComponentWidget().expand,
        ],
      ),
    );
  }

  @override
  Widget? phone() {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.screenBackgroundColor,
          appBar: const CustomAppBar(
            title: 'Menu',
          ),
          drawer: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(isRTL ? 0.0 : 35.0),
              bottomRight: Radius.circular(isRTL ? 0.0 : 35.0),
              topLeft: Radius.circular(isRTL ? 35.0 : 0.0),
              bottomLeft: Radius.circular(isRTL ? 35.0 : 0.0),
            ),
            child: Drawer(
              child: MenuComponentWidget(),
            ),
          ),
          body: PagesComponentWidget()),
    );
  }

  @override
  Widget? tablet() {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.screenBackgroundColor,
          appBar: const CustomAppBar(
            title: 'Menu',
          ),
          drawer: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(isRTL ? 0.0 : 35.0),
              bottomRight: Radius.circular(isRTL ? 0.0 : 35.0),
              topLeft: Radius.circular(isRTL ? 35.0 : 0.0),
              bottomLeft: Radius.circular(isRTL ? 35.0 : 0.0),
            ),
            child: Drawer(
              child: MenuComponentWidget(),
            ),
          ),
          body: PagesComponentWidget()),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Container();
// }
}

class PageContainer extends StatelessWidget {
  final String text;

  PageContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // child: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             height: 450,
      //             // decoration: BoxDecoration(
      //             //     borderRadius: const BorderRadius.all(kRadius12),
      //             //     color: AppColors.backgroundColor100),
      //             // padding: EdgeInsets.all(20),
      //             child: LineChartWidget(),
      //           ),
      //         ),
      //         const SizedBox(width: 30.0),
      //         Expanded(
      //           child: Container(
      //             height: 400,
      //             child: LineChartWidget(),
      //           ),
      //         ),
      //       ],
      //     ),
      //     Container(
      //       height: 400,
      //       child: LineChartWidget(),
      //       // child: Row(
      //       //   children: [
      //       //
      //       //     LineChartWidget(),
      //       //     //PieChartSample2(),
      //       //   ],
      //       // ),
      //     )
      //   ],
      // ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 150,
            fontWeight: FontWeight.w900,
            color: Colors.black26,
          ),
        ),
      ),
    ); //.withVerticalScroll;
  }
}

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    AppColors.primaryColor,
    AppColors.lighten(AppColors.primaryColor, 0.3),
  ];

  LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        // decoration: BoxDecoration(
        //     borderRadius: const BorderRadius.all(kRadius12),
        //     color: AppColors.backgroundColor100),
        color: AppColors.backgroundColor100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTextStyles: (value, v) => const TextStyle(
                        color: Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return 'MAR';
                        case 5:
                          return 'JUN';
                        case 8:
                          return 'SEP';
                      }
                      return '';
                    },
                    margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value, v) => const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return '10k';
                        case 3:
                          return '30k';
                        case 5:
                          return '50k';
                      }
                      return '';
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 1)),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                    ),
                  ),
                ],
              ),
              // LineChartData(
              //   minX: 0,
              //   maxX: 11,
              //   minY: 0,
              //   maxY: 6,
              //   backgroundColor: AppColors.backgroundColor100,
              //   titlesData: LineTitles.getTitleData(),
              //   gridData: FlGridData(
              //     show: true,
              //     drawVerticalLine: true,
              //     getDrawingHorizontalLine: (value) {
              //       return FlLine(
              //         color: const Color(0xff37434d),
              //         strokeWidth: 1,
              //       );
              //     },
              //     getDrawingVerticalLine: (value) {
              //       return FlLine(
              //         color: const Color(0xff37434d),
              //         strokeWidth: 1,
              //       );
              //     },
              //   ),
              //   borderData: FlBorderData(
              //     show: true,
              //     border: Border.all(color: const Color(0xff37434d), width: 1),
              //   ),
              //   lineBarsData: [
              //     LineChartBarData(
              //       spots: [
              //         FlSpot(0, 3),
              //         FlSpot(2.6, 2),
              //         FlSpot(4.9, 5),
              //         FlSpot(6.8, 2.5),
              //         FlSpot(8, 4),
              //         FlSpot(9.5, 3),
              //         FlSpot(11, 4),
              //       ],
              //       isStrokeCapRound: true,
              //       dotData: FlDotData(
              //         show: false,
              //       ),
              //       isCurved: true,
              //       colors: gradientColors,
              //       barWidth: 5,
              //       belowBarData: BarAreaData(
              //         show: true,
              //         colors: gradientColors
              //             .map((color) => color.withOpacity(0.3))
              //             .toList(),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      );
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value, m) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'شيكات';
              case 5:
                return 'مصروفات';
              case 8:
                return 'ايرادات';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value, n) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '30';
              case 5:
                return '50';
            }
            return '';
          },
          reservedSize: 35,
          //margin: 12,
        ),
      );
}
