import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/base/app_settings_controller.dart';
import 'package:pos/base/constants.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/local_storage.dart';
import 'package:pos/models/menu_item_model.dart';

import 'settings_page_container.dart';

class SettingsMenuWidget extends GetResponsiveView<AppSettingsController> {
  SettingsMenuWidget({Key? key}) : super(key: key, alwaysUseBuilder: false);

  @override
  Widget? desktop() {
    return Container(
      width: 300,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(kRadius12),
        color: AppColors.backgroundColor100,
        boxShadow: AppColors.shadows0,
      ),
      child: Column(
        children: controller.settingsItemsList.map((item) {
          return MenuItemWidget(item: item);
        }).toList(),
      ),
    );
  }

  @override
  Widget? tablet() {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      return SizedBox(
        height: double.maxFinite,
        child: DefaultTabController(
            length: controller.settingsItemsList.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: true,
                  onTap: (index) {
                    controller.onTap(controller.settingsItemsList[index]);
                  },
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.primaryColor,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 4.0),
                    insets: EdgeInsets.fromLTRB(
                        isRTL ? 40.0 : 0.0, 0.0, isRTL ? 0.0 : 40.0, 0.0),
                  ),
                  tabs: controller.settingsItemsList.map((item) {
                    return Tab(
                      child: Column(
                        children: [
                          ItemIconWidget(
                            isChocked: item.isChocked,
                            icon: item.icon,
                          ),
                          ItemTitleWidget(
                            title: item.title,
                            isChocked: item.isChocked,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor100,
                    borderRadius: const BorderRadius.only(
                        topRight: kRadius12, topLeft: kRadius12),
                  ),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: sittingsPageList(controller),
                  ),
                ).expand,
              ],
            )),
      );
    });
  }

  @override
  Widget? phone() {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      return SizedBox(
        height: double.maxFinite,
        child: DefaultTabController(
            length: controller.settingsItemsList.length,
            child: Column(
              children: [
                TabBar(
                  automaticIndicatorColorAdjustment: true,
                  isScrollable: true,
                  onTap: (index) {
                    controller.onTap(controller.settingsItemsList[index]);
                  },
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: AppColors.primaryColor,
                  tabs: controller.settingsItemsList.map((item) {
                    return Tab(
                      child: Column(
                        children: [
                          ItemIconWidget(
                            isChocked: item.isChocked,
                            icon: item.icon,
                          ),
                          ItemTitleWidget(
                            title: item.title,
                            isChocked: item.isChocked,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor100,
                    borderRadius: const BorderRadius.only(
                        topRight: kRadius12, topLeft: kRadius12),
                  ),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: sittingsPageList(controller),
                  ),
                ).expand,
              ],
            )),
      );
    });
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItemModel item;

  const MenuItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(kRadius12),
              color: item.isChocked
                  ? AppColors.selectedMenuChildItemBackgroundColor
                  : AppColors.backgroundColor100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemIconWidget(
                    isChocked: item.isChocked,
                    icon: item.icon,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemTitleWidget(
                        title: item.title,
                        isChocked: item.isChocked,
                      ),
                      Text(
                        item.subTitle,
                        style: GoogleFonts.cairo(
                            color: item.isChocked
                                ? AppColors.titleTextColor
                                : AppColors.subTitleTextColor,
                            fontSize: 12),
                      ),
                    ],
                  ).expand,
                ],
              ).addPaddingAll(16.0).expand,
              if (item.isChocked)
                Container(
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          ),
        ).onTap(() {
          controller.onTap(item);
        });
      },
    );
  }
}

class ItemIconWidget extends StatelessWidget {
  final IconData? icon;
  final bool isChocked;

  ItemIconWidget({Key? key, required this.icon, required this.isChocked})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 18,
      color: isChocked ? AppColors.primaryColor : AppColors.subTitleTextColor,
    );
  }
}

class ItemTitleWidget extends StatelessWidget {
  final String title;
  final bool isChocked;

  ItemTitleWidget({Key? key, required this.title, required this.isChocked})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.cairo(
          color: isChocked ? AppColors.primaryColor : AppColors.titleTextColor,
          fontWeight: FontWeight.w700),
    );
  }
}
