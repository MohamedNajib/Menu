import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/views/landingPage/menu/models/nav_model.dart';

class MenuItemTextWidget extends StatelessWidget {
  final NavModel menuItem;
  const MenuItemTextWidget({Key? key, required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        menuItem.title,
        style: GoogleFonts.cairo(
            color: menuItem.isChocked
                ? AppColors.selectedMenuChildItemTextColor
                : AppColors.defaultMainMenuItemTextColor,
            fontWeight: menuItem.isChocked ? FontWeight.bold : FontWeight.w600),
      );
}
