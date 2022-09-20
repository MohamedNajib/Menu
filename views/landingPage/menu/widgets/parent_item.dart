import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/base/values/values.dart';
import 'package:pos/views/landingPage/menu/controllers/menu_controaller.dart';
import 'package:pos/views/landingPage/menu/models/nav_model.dart';

import 'expanded_card_widget.dart';
import 'menu_item_text_widget.dart';

class ParentItemWidget extends StatelessWidget {
  final NavModel mainItem;

  const ParentItemWidget({Key? key, required this.mainItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
      builder: (controller) {
        return Column(
          children: [
            ExpandedCardWidget(
              title: mainItem.title,
              leading: mainItem.icon!,
              bodyWidget: Container(
                margin: const EdgeInsets.only(bottom: 0.8),
                child: Column(
                  children: controller.navModel.map((childItem) {
                    return (childItem.parentId == mainItem.id)
                        ? Container(
                            decoration: BoxDecoration(
                              color: childItem.isChocked
                                  ? AppColors
                                      .selectedMenuChildItemBackgroundColor
                                  : null,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: ListTile(
                              onTap: () {
                                controller.onTap(childItem);
                              },
                              title: MenuItemTextWidget(menuItem: childItem),
                            ),
                          )
                        : const SizedBox(width: 0, height: 0);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(width: 0, height: 16)
          ],
        );
      },
    );
  }
}
