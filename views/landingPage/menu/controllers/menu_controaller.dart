import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:size_config/size_config.dart';

import '../models/nav_model.dart';

class MenuController extends GetxController with SingleGetTickerProviderMixin {
  //Color textColor = AppColors.secondaryChildColor;
  onTap(childItem) {
    if (isM || isT) {
      Get.back();
    }
    for (int i = 0; i < navModel.length; i++) {
      navModel[i].isChocked = false;
    }
    //childItem.isChocked = true;
    navModel[navModel.indexOf(childItem)].isChocked = true;
    itemCheckedIndex = navModel.indexOf(childItem);
    update();
  }

  int itemCheckedIndex = 0;
  List<NavModel> navModel = [
    NavModel(
        id: 00,
        isChocked: true,
        title: 'الرئيسية',
        icon: AntDesign.home,
        itemStatus: ItemStatus.single),
    NavModel(
        id: 1,
        title: 'الدليل المحاسبي',
        icon: MaterialIcons.account_tree,
        itemStatus: ItemStatus.parent),
    NavModel(
        id: 7,
        title: 'شجرة الحسابات',
        parentId: 1,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 8,
        title: 'مراكز التكلفة',
        parentId: 1,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 9, title: 'انواع القيو', parentId: 1, itemStatus: ItemStatus.child),
    NavModel(
        id: 2,
        title: 'حسابات عامة',
        icon: Icons.account_balance_outlined,
        itemStatus: ItemStatus.parent),
    NavModel(
        id: 11,
        title: 'قيود اليومية العامة',
        parentId: 2,
        itemStatus: ItemStatus.child),
    NavModel(id: 12, title: 'شيكات', parentId: 2, itemStatus: ItemStatus.child),
    NavModel(
        id: 13, title: 'مصروفات', parentId: 2, itemStatus: ItemStatus.child),
    NavModel(
        id: 14, title: 'ايرادات', parentId: 2, itemStatus: ItemStatus.child),
    NavModel(
        id: 3,
        title: 'قوائم مالية',
        icon: MaterialCommunityIcons.finance,
        itemStatus: ItemStatus.parent),
    NavModel(
        id: 14, title: 'كشف حساب', parentId: 3, itemStatus: ItemStatus.child),
    NavModel(
        id: 15,
        title: 'ميزان المراجعة',
        parentId: 3,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 16,
        title: 'قوائم مخصصة',
        parentId: 3,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 4,
        title: 'لوحة التحكم',
        icon: MaterialCommunityIcons.view_dashboard_outline,
        itemStatus: ItemStatus.parent),
    NavModel(
        id: 20,
        title: 'ادارة المستخدمين',
        parentId: 4,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 21,
        title: 'ترحيل العمليات',
        parentId: 4,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 22,
        title: 'تغير السنة المالية',
        parentId: 4,
        itemStatus: ItemStatus.child),
    NavModel(
        id: 00,
        title: 'الإعدادات',
        icon: Ionicons.settings_outline,
        itemStatus: ItemStatus.single),
  ];
}
