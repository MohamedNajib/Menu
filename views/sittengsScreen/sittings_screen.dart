import 'package:extensions_package/extensions_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/app_settings_controller.dart';
import 'package:pos/base/constants.dart';
import 'package:pos/base/values/colors.dart';
import 'package:pos/views/sittengsScreen/widget/settings_page_container.dart';

import 'widget/settings.dart';

class SittingsScreen extends GetResponsiveView<AppSettingsController> {
  final String title;
  SittingsScreen({Key? key, required this.title})
      : super(key: key, alwaysUseBuilder: false);
  @override
  Widget? desktop() {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SettingsMenuWidget(),
          const SizedBox(width: 24.0),
          Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor100,
              borderRadius: const BorderRadius.only(
                  topRight: kRadius12, topLeft: kRadius12),
            ),
            child: IndexedStack(
              index: controller.itemCheckedIndex,
              children: sittingsPageList(controller),
            ),
          ).expand,
        ],
      );
    });
  }

  @override
  Widget? tablet() {
    return SettingsMenuWidget();
  }

  @override
  Widget? phone() {
    return GetBuilder<AppSettingsController>(builder: (controller) {
      return SettingsMenuWidget();
    });
  }
}

class BasicTilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children:
              basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
}

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.tiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title), onTap: () {},
        selectedTileColor: Colors.purple,
        // => Utils.showSnackBar(
        //   context,
        //   text: 'Clicked on: $title',
        //   color: Colors.green,
        // ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          // border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          //backgroundColor: Colors.purple,
          children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}

final basicTiles = <BasicTile>[
  BasicTile(title: 'Countries', tiles: [
    BasicTile(title: 'Russia'),
    BasicTile(title: 'Canada'),
    BasicTile(title: 'USA'),
    BasicTile(title: 'China'),
    BasicTile(title: 'China'),
    BasicTile(title: 'Australia'),
    BasicTile(title: 'India'),
    BasicTile(title: 'Argentina'),
  ]),
  BasicTile(title: 'Dates', tiles: [
    BasicTile(title: '2020', tiles: buildMonths()),
    BasicTile(title: '2021', tiles: buildMonths()),
    BasicTile(title: '2022'),
    BasicTile(title: '2023'),
  ]),
];

List<BasicTile> buildMonths() => [
      'January',
      'February',
      'March',
      'April',
      'November',
      'December',
    ].map<BasicTile>(buildMonth).toList();

BasicTile buildMonth(String month) => BasicTile(
    title: month,
    tiles: List.generate(28, (index) => BasicTile(title: '$index.')));

class BasicTile {
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({
    required this.title,
    this.tiles = const [],
  });
}

// class TextTilePage extends StatefulWidget {
//   @override
//   _TextTilePageState createState() => _TextTilePageState();
// }
//
// class _TextTilePageState extends State<TextTilePage> {
//   static final double radius = 20;
//
//   UniqueKey? keyTile;
//   bool isExpanded = false;
//
//   void expandTile() {
//     setState(() {
//       isExpanded = true;
//       keyTile = UniqueKey();
//     });
//   }
//
//   void shrinkTile() {
//     setState(() {
//       isExpanded = false;
//       keyTile = UniqueKey();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Padding(
//           padding: EdgeInsets.all(12),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(radius),
//               side: BorderSide(color: Colors.black, width: 2),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(radius),
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () => isExpanded ? shrinkTile() : expandTile(),
//                       child: buildImage(),
//                     ),
//                     buildText(context),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//
//   Widget buildImage() => Image.network(
//         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: 400,
//       );
//
//   Widget buildText(BuildContext context) => Theme(
//         data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//         child: ExpansionTile(
//             key: keyTile,
//             initiallyExpanded: isExpanded,
//             childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
//             title: Text(
//               '👩 Sarah Pepperstone',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             ),
//             children: [
//               Text(
//                 'My name is Sarah and I am a New York City based Flutter developer. I help entrepreneurs & businesses figure out how to build scalable applications.\n\nWith over 7 years experience spanning across many industries from B2B to B2C, I live and breath Flutter.',
//                 style: TextStyle(fontSize: 18, height: 1.4),
//               ),
//             ],
//             onExpansionChanged: (isExpanded) {}
//             // => Utils.showSnackBar(
//             //   context,
//             //   text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
//             //   color: isExpanded ? Colors.green : Colors.red,
//             // ),
//             ),
//       );
// }
//
// class AdvancedTile {
//   final String title;
//   final IconData icon;
//   final List<AdvancedTile> tiles;
//   bool isExpanded;
//
//   AdvancedTile({
//     required this.title,
//     this.icon = Icons.add,
//     this.tiles = const [],
//     this.isExpanded = false,
//   });
// }
//
// final advancedTiles = <AdvancedTile>[
//   AdvancedTile(
//     icon: Icons.language,
//     title: 'Countries',
//     tiles: [
//       AdvancedTile(title: 'Russia'),
//       AdvancedTile(title: 'Canada'),
//       AdvancedTile(title: 'USA'),
//       AdvancedTile(title: 'China'),
//       AdvancedTile(title: 'China'),
//       AdvancedTile(title: 'Australia'),
//       AdvancedTile(title: 'India'),
//       AdvancedTile(title: 'Argentina'),
//       AdvancedTile(title: 'Argentina'),
//       AdvancedTile(title: 'Argentina'),
//       AdvancedTile(title: 'Argentina'),
//       AdvancedTile(title: 'Argentina'),
//       AdvancedTile(title: 'Argentina'),
//     ],
//   ),
//   AdvancedTile(
//     icon: Icons.date_range,
//     title: 'Dates',
//     tiles: [
//       AdvancedTile(title: '2020'),
//       AdvancedTile(title: '2021'),
//       AdvancedTile(title: '2022'),
//       AdvancedTile(title: '2023'),
//     ],
//   ),
//   AdvancedTile(
//     icon: Icons.favorite_border,
//     title: 'Animals',
//     tiles: [
//       AdvancedTile(title: 'Cat'),
//       AdvancedTile(title: 'Dog'),
//       AdvancedTile(title: 'Lion'),
//       AdvancedTile(title: 'Elephant'),
//       AdvancedTile(title: 'Giraffe'),
//     ],
//   ),
// ];
//
// class AdvancedTilePage extends StatefulWidget {
//   @override
//   _AdvancedTilePageState createState() => _AdvancedTilePageState();
// }
//
// class _AdvancedTilePageState extends State<AdvancedTilePage> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: SingleChildScrollView(
//           child: ExpansionPanelList.radio(
//             expansionCallback: (index, isExpanded) {
//               final tile = advancedTiles[index];
//               setState(() => tile.isExpanded = isExpanded);
//
//               // Utils.showSnackBar(
//               //   context,
//               //   text: isExpanded
//               //       ? 'Shrink ${tile.title}'
//               //       : 'Expand ${tile.title}',
//               //   color: Colors.green,
//               // );
//             },
//             children: advancedTiles
//                 .map((tile) => ExpansionPanelRadio(
//                       value: tile.title,
//                       canTapOnHeader: true,
//                       headerBuilder: (context, isExpanded) => buildTile(tile),
//                       body: Column(
//                         children: tile.tiles.map(buildTile).toList(),
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       );
//
//   Widget buildTile(AdvancedTile tile) => ListTile(
//         leading: tile.icon != null ? Icon(tile.icon) : null,
//         title: Text(tile.title),
//         onTap: () {},
//         // tile.tiles.isEmpty
//         //     ? () => Utils.showSnackBar(
//         //   context,
//         //   text: 'Clicked on: ${tile.title}',
//         //   color: Colors.green,
//         // )
//         //     : null,
//       );
// }
// Welcome to another flutter tutorial
// In this video we will see how to create a multi-level Expansion List
// First Let's create a class for each row in the Expansion List

// class Entry {
//   final String title;
//   final List<Entry>
//       children; // Since this is an expansion list ...children can be another list of entries
//   Entry(this.title, [this.children = const <Entry>[]]);
// }
//
// // This is the entire multi-level list displayed by this app
// final List<Entry> data = <Entry>[
//   Entry(
//     'Chapter A',
//     <Entry>[
//       Entry(
//         'Section A0',
//         <Entry>[
//           Entry('Item A0.1'),
//           Entry('Item A0.2'),
//           Entry('Item A0.3'),
//         ],
//       ),
//       Entry('Section A1'),
//       Entry('Section A2'),
//     ],
//   ),
//   // Second Row
//   Entry('Chapter B', <Entry>[
//     Entry('Section B0'),
//     Entry('Section B1'),
//   ]),
//   Entry(
//     'Chapter C',
//     <Entry>[
//       Entry('Section C0'),
//       Entry('Section C1'),
//       Entry(
//         'Section C2',
//         <Entry>[
//           Entry('Item C2.0'),
//           Entry('Item C2.1'),
//           Entry('Item C2.2'),
//           Entry('Item C2.3'),
//         ],
//       )
//     ],
//   ),
// ];
//
// // Create the Widget for the row
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);
//   final Entry entry;
//
//   // This function recursively creates the multi-level list rows.
//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty) {
//       return ListTile(
//         title: Text(root.title),
//       );
//     }
//     return ExpansionTile(
//       key: PageStorageKey<Entry>(root),
//       title: Text(root.title),
//       children: root.children.map<Widget>(_buildTiles).toList(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }
