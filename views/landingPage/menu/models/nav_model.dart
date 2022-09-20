import 'package:flutter/material.dart';

class NavModel {
  int id;
  String title;
  IconData? icon;
  bool isChocked;
  int? parentId;
  ItemStatus itemStatus;

  NavModel({
    required this.id,
    required this.itemStatus,
    this.isChocked = false,
    required this.title,
    this.parentId,
    this.icon,
  });
}

enum ItemStatus { parent, child, single }
