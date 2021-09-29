import 'package:flutter/material.dart';

class GoodsInfo {
  final String title;
  final String price;
  const GoodsInfo(this.title, this.price);
}

final List<GoodsInfo> goods = [
  GoodsInfo("250ml", "1.56\$"),
  GoodsInfo("500ml", "2.19\$"),
  GoodsInfo("1.0L", "2.99\$")
];

class BottomBarItem{
  const BottomBarItem(this.icon, this.title, this.activeColor, this.defaultColor);

  final Widget icon;
  final Text title;
  final Color activeColor;
  final Color? defaultColor;
}