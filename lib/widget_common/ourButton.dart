import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/strings.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor, title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: const EdgeInsets.all(12)),
      onPressed: onPress,
      child: title.toString().text.color(textColor).fontFamily(bold).make());
}
