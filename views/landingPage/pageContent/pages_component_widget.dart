import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/app_settings_controller.dart';
import 'package:pos/views/landingPage/menu/controllers/menu_controaller.dart';
import 'package:pos/views/sittengsScreen/sittings_screen.dart';

import 'header_widget.dart';

class PagesComponentWidget extends GetResponsiveView<AppSettingsController> {
  PagesComponentWidget({Key? key}) : super(key: key, alwaysUseBuilder: false);

  @override
  Widget? desktop() {
    return GetBuilder<MenuController>(
      builder: (MenuController menuController) {
        return Row(
          children: [
            const SizedBox(width: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: menuController
                      .navModel[menuController.itemCheckedIndex].title,
                ),
                PagesContentWidget().expand,
              ],
            ).expand,
            const SizedBox(width: 24.0),
          ],
        );
      },
    );
  }

  @override
  Widget? tablet() {
    return GetBuilder<MenuController>(
      builder: (MenuController menuController) {
        return Row(
          children: [
            const SizedBox(width: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: menuController
                      .navModel[menuController.itemCheckedIndex].title,
                ),
                PagesContentWidget().expand,
              ],
            ).expand,
            const SizedBox(width: 24.0),
          ],
        );
      },
    );
  }

  @override
  Widget? phone() {
    return GetBuilder<MenuController>(
      builder: (MenuController menuController) {
        return PagesContentWidget();
      },
    );
  }
}

class PagesContentWidget extends StatelessWidget {
  PagesContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(builder: (MenuController menuController) {
      return IndexedStack(
        index: menuController.itemCheckedIndex,
        children: [
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          PageContainer(
              menuController.navModel[menuController.itemCheckedIndex].title),
          // PageContainer(menuController
          //     .navModel[menuController.itemCheckedIndex].title),
          SittingsScreen(
              title: menuController
                  .navModel[menuController.itemCheckedIndex].title),
        ],
      );
    });
  }
}

class PageContainer extends StatelessWidget {
  final String text;

  PageContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black26,
          ),
        ),
      ),
    ); //.withVerticalScroll;
  }
}
