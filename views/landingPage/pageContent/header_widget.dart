import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/base/values/values.dart';

import '../landing_controller.dart';

class HeaderWidget extends GetResponsiveView<LandingController> {
  final String title;
  HeaderWidget({Key? key, required this.title})
      : super(key: key, alwaysUseBuilder: false);

  @override
  Widget? desktop() {
    return HeaderTitleWidget(
      title: title,
      withSpace: 32.0,
    );
  }

  @override
  Widget? tablet() {
    return HeaderTitleWidget(
      title: title,
      withSpace: 16.0,
    );
  }

  @override
  Widget? phone() {
    return HeaderTitleWidget(
      title: title,
      withSpace: 16.0,
    );
  }
}

class HeaderTitleWidget extends StatelessWidget {
  final double withSpace;
  final String title;
  HeaderTitleWidget({Key? key, required this.withSpace, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: withSpace),
        Text(
          title,
          style: GoogleFonts.cairo(
              color: AppColors.headerTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        SizedBox(height: withSpace),
      ],
    );
  }
}
