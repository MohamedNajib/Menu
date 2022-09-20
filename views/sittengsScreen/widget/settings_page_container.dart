import 'package:flutter/material.dart';
import 'package:pos/base/app_settings_controller.dart';
import 'package:pos/views/landingPage/landing_page.dart';

import 'settings.dart';

List<Widget> sittingsPageList(AppSettingsController controller) => [
      AppSettingsWidget(
          itemText:
              controller.settingsItemsList[controller.itemCheckedIndex].title),
      // LanguageWidget(
      //     itemText: controller
      //         .settingsItemsList[controller.itemCheckedIndex].title),
      PageContainer(
          controller.settingsItemsList[controller.itemCheckedIndex].title),
      PageContainer(
          controller.settingsItemsList[controller.itemCheckedIndex].title),
    ];
