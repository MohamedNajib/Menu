import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/base/app_settings_controller.dart';
import 'package:pos/base/values/colors.dart';
import 'package:pos/base/values/values.dart';
import 'package:size_config/size_config.dart';

class AppSettingsWidget extends GetResponsiveView<AppSettingsController> {
  final String itemText;

  AppSettingsWidget({Key? key, required this.itemText})
      : super(key: key, alwaysUseBuilder: false);

  @override
  Widget? desktop() {
    return GetBuilder<AppSettingsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSettingsHeader(
              title: Strings.appearance.tr,
              des: Strings.appearanceDes.tr,
            ),
            // Row(
            //   children: controller.themePreferencesList.map((theme) {
            //     return Container(
            //       width: 250,
            //       margin: const EdgeInsets.all(8.0),
            //       padding: const EdgeInsets.all(16),
            //       decoration: BoxDecoration(
            //         color: AppColors.screenBackgroundColor,
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       //color: Colors.orange,
            //       child: Column(
            //         children: [
            //           SvgPicture.asset(
            //             theme.image,
            //             width: 150,
            //             height: 150,
            //           ),
            //           Divider(
            //             color: AppColors.lineColor,
            //           ),
            //           Row(
            //             children: [
            //               Icon(
            //                 theme.isChocked
            //                     ? Ionicons.ios_checkmark_circle_sharp
            //                     : Entypo.circle,
            //                 color: AppColors.primaryColor,
            //               ),
            //               const SizedBox(width: 8.0),
            //               Text(
            //                 theme.themeName.tr,
            //                 style: GoogleFonts.cairo(
            //                     fontSize: 14,
            //                     fontWeight: theme.isChocked
            //                         ? FontWeight.bold
            //                         : FontWeight.normal,
            //                     color: theme.isChocked
            //                         ? AppColors.primaryColor
            //                         : AppColors.headerTextColor),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ).onTap(() {
            //       controller.onThemePreferencesTap(theme);
            //     });
            //   }).toList(),
            // ).withHorizontalScroll,
            ThemePreferencesWidget(),
            const SizedBox(height: 16.0),
            AppSettingsHeader(
              title: Strings.language.tr,
              des: Strings.appearanceDes.tr,
            ).addPaddingHorizontal(16.0),
            LanguageWidget(),
          ],
        ).paddingAll(24.0);
      },
    );
  }

  @override
  Widget? phone() {
    return GetBuilder<AppSettingsController>(
      builder: (controller) {
        return ListView(
          children: [
            const SizedBox(height: 16.0),
            AppSettingsHeader(
              title: Strings.appearance.tr,
              des: Strings.appearanceDes.tr,
            ).addPaddingHorizontal(16.0),
            // Row(
            //   children: controller.themePreferencesList.map((theme) {
            //     return Container(
            //       width: 50.w,
            //       margin: const EdgeInsets.all(8.0),
            //       padding: const EdgeInsets.all(16),
            //       decoration: BoxDecoration(
            //         color: AppColors.screenBackgroundColor,
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       //color: Colors.orange,
            //       child: Column(
            //         children: [
            //           SvgPicture.asset(
            //             theme.image,
            //             width: 40.w,
            //             height: 40.w,
            //           ),
            //           Divider(
            //             color: AppColors.lineColor,
            //           ),
            //           Row(
            //             children: [
            //               Icon(
            //                 theme.isChocked
            //                     ? Ionicons.ios_checkmark_circle_sharp
            //                     : Entypo.circle,
            //                 color: AppColors.primaryColor,
            //               ),
            //               const SizedBox(width: 8.0),
            //               Text(
            //                 theme.themeName.tr,
            //                 style: GoogleFonts.cairo(
            //                     fontSize: 14,
            //                     fontWeight: theme.isChocked
            //                         ? FontWeight.bold
            //                         : FontWeight.normal,
            //                     color: theme.isChocked
            //                         ? AppColors.primaryColor
            //                         : AppColors.headerTextColor),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ).onTap(() {
            //       controller.onThemePreferencesTap(theme);
            //     });
            //   }).toList(),
            // ).withHorizontalScroll,
            ThemePreferencesWidget(),
            const SizedBox(height: 16.0),
            AppSettingsHeader(
              title: Strings.language.tr,
              des: Strings.appearanceDes.tr,
            ).addPaddingHorizontal(16.0),
            LanguageWidget().addPaddingHorizontal(16.0)
          ],
        );
      },
    );
  }

  @override
  Widget? tablet() {
    return GetBuilder<AppSettingsController>(
      builder: (controller) {
        return ListView(
          children: [
            const SizedBox(height: 16.0),
            AppSettingsHeader(
              title: Strings.appearance.tr,
              des: Strings.appearanceDes.tr,
            ).addPaddingHorizontal(16.0),
            // Row(
            //   children: controller.themePreferencesList.map((theme) {
            //     return Container(
            //       width: 50.w,
            //       margin: const EdgeInsets.all(8.0),
            //       padding: const EdgeInsets.all(16),
            //       decoration: BoxDecoration(
            //         color: AppColors.screenBackgroundColor,
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       //color: Colors.orange,
            //       child: Column(
            //         children: [
            //           SvgPicture.asset(
            //             theme.image,
            //             width: 40.w,
            //             height: 40.w,
            //           ),
            //           Divider(
            //             color: AppColors.lineColor,
            //           ),
            //           Row(
            //             children: [
            //               Icon(
            //                 theme.isChocked
            //                     ? Ionicons.ios_checkmark_circle_sharp
            //                     : Entypo.circle,
            //                 color: AppColors.primaryColor,
            //               ),
            //               const SizedBox(width: 8.0),
            //               Text(
            //                 theme.themeName.tr,
            //                 style: GoogleFonts.cairo(
            //                     fontSize: 14,
            //                     fontWeight: theme.isChocked
            //                         ? FontWeight.bold
            //                         : FontWeight.normal,
            //                     color: theme.isChocked
            //                         ? AppColors.primaryColor
            //                         : AppColors.headerTextColor),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ).onTap(() {
            //       controller.onThemePreferencesTap(theme);
            //     });
            //   }).toList(),
            // ).withHorizontalScroll,
            ThemePreferencesWidget(),
            const SizedBox(height: 16.0),
            AppSettingsHeader(
              title: Strings.language.tr,
              des: Strings.appearanceDes.tr,
            ).addPaddingHorizontal(16.0),
            LanguageWidget().addPaddingHorizontal(16.0)
          ],
        );
      },
    );
  }
}

class AppSettingsHeader extends StatelessWidget {
  final String title;
  final String des;

  const AppSettingsHeader({Key? key, required this.title, required this.des})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
              color: AppColors.titleTextColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: isD ? 16.0 : 8.0),
        Divider(
          color: AppColors.lineColor,
        ),
        SizedBox(height: isD ? 16.0 : 8.0),
        Text(
          des,
          style: GoogleFonts.cairo(
              color: AppColors.subTitleTextColor, fontSize: 16.0),
        ),
        SizedBox(height: isD ? 16.0 : 8.0),
      ],
    );
  }
}

class ThemePreferencesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      return Row(
        children: controller.themePreferencesList.map((theme) {
          return Container(
            width: isM ? 50.w : 250,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.screenBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            //color: Colors.orange,
            child: Column(
              children: [
                SvgPicture.asset(
                  theme.image,
                  width: isM ? 40.w : 150,
                  height: isM ? 40.w : 150,
                ),
                Divider(
                  color: AppColors.lineColor,
                ),
                Row(
                  children: [
                    Icon(
                      theme.isChocked
                          ? Ionicons.ios_checkmark_circle_sharp
                          : Entypo.circle,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      theme.themeName.tr,
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: theme.isChocked
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: theme.isChocked
                              ? AppColors.primaryColor
                              : AppColors.headerTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ).onTap(() {
            controller.onThemePreferencesTap(theme);
          });
        }).toList(),
      ).withHorizontalScroll;
    });
  }
}

class LanguageWidget extends StatelessWidget {
// final String itemText;
//
// const LanguageWidget({Key? key, required this.itemText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettingsController>(
      builder: (AppSettingsController controller) {
        return Row(
          children: [
            Row(
              children: [
                Icon(
                  controller.appLocale == 'ar'
                      ? Ionicons.ios_checkmark_circle_sharp
                      : Entypo.circle,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'ar',
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: controller.appLocale == 'ar'
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: AppColors.headerTextColor),
                ),
              ],
            ).onTap(() {
              if (controller.appLocale == 'ar') {
                return;
              }
              controller.changeLanguage('ar');
            }),
            const SizedBox(width: 36.0),
            Row(
              children: [
                Icon(
                  controller.appLocale == 'en'
                      ? Ionicons.ios_checkmark_circle_sharp
                      : Entypo.circle,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'en',
                  style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: controller.appLocale == 'en'
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: AppColors.headerTextColor),
                ),
              ],
            ).onTap(() {
              if (controller.appLocale == 'en') {
                return;
              }
              controller.changeLanguage('en');
            }),
          ],
        );
        // return ElevatedButton(
        //   onPressed: () {
        //     if (controller.appLocale == 'en') {
        //       controller.changeLanguage('ar');
        //     } else {
        //       controller.changeLanguage('en');
        //     }
        //   },
        //   style: TextButton.styleFrom(
        //       // padding: EdgeInsets.symmetric(
        //       //   horizontal: 16 * 1.5,
        //       //   vertical: 16 / (SizeConfig.Device.screenType == SizeConfig.ScreenType.desktop ? 1 : 2),
        //       // ),
        //       ),
        //   child: Text("${(controller.appLocale == 'en') ? 'عربي' : 'English'}"),
        // );
      },
    );
  }
}
