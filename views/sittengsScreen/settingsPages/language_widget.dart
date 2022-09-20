// class LanguageWidget extends StatelessWidget {
//   // final String itemText;
//   //
//   // const LanguageWidget({Key? key, required this.itemText}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AppSettingsController>(
//       builder: (AppSettingsController controller) {
//         return ElevatedButton(
//           onPressed: () {
//             if (controller.appLocale == 'en') {
//               controller.changeLanguage('ar');
//             } else {
//               controller.changeLanguage('en');
//             }
//           },
//           style: TextButton.styleFrom(
//               // padding: EdgeInsets.symmetric(
//               //   horizontal: 16 * 1.5,
//               //   vertical: 16 / (SizeConfig.Device.screenType == SizeConfig.ScreenType.desktop ? 1 : 2),
//               // ),
//               ),
//           child: Text("${(controller.appLocale == 'en') ? 'عربي' : 'English'}"),
//         );
//       },
//     );
//   }
// }
