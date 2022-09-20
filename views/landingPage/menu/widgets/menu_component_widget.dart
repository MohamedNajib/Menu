import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/views/landingPage/menu/controllers/menu_controaller.dart';
import 'package:pos/views/landingPage/menu/models/nav_model.dart';
import 'package:size_config/size_config.dart';

import 'parent_item.dart';
import 'single_item.dart';

class MenuComponentWidget extends StatelessWidget {
  MenuComponentWidget({
    Key? key,
  }) : super(key: key);

  final MenuController menuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.all(isM || isT ? 0.0 : 20.0),
      width: isM || isT ? double.maxFinite : 280,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: AppColors.mainMenuGradientBackGroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(isM || isT ? 0.0 : 35),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: menuController.navModel.map((mainItem) {
          return mainItem.parentId == null
              ? mainItem.itemStatus == ItemStatus.parent
                  ? ParentItemWidget(mainItem: mainItem)
                  : SingleItemWidget(singleItem: mainItem)
              : const SizedBox(width: 0, height: 0);
        }).toList(),
      ),
    );
  }
}
