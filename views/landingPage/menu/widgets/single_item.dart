import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/views/landingPage/menu/controllers/menu_controaller.dart';
import 'package:pos/views/landingPage/menu/models/nav_model.dart';

import 'menu_item_text_widget.dart';

class SingleItemWidget extends StatelessWidget {
  final NavModel singleItem;

  const SingleItemWidget({Key? key, required this.singleItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      builder: (controller) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: singleItem.isChocked
                    ? AppColors.selectedMenuChildItemBackgroundColor
                    : AppColors.defaultMainMenuItemColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              //Colors.blueAccent
              child: ListTile(
                onTap: () {
                  controller.onTap(singleItem);
                },
                leading: Icon(singleItem.icon,
                    color: !singleItem.isChocked
                        ? AppColors.mainIconColor
                        : AppColors.selectedIconColor),
                title: MenuItemTextWidget(menuItem: singleItem),
              ),
            ),
            const SizedBox(height: 16)
          ],
        );
      },
    );
  }
}
// #F2F3F7   #FEFEFE
