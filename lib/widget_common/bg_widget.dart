import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.cover)),
    child: child,
  );
}
