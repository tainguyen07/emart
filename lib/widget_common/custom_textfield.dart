import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({required String hint, required String title}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    title.text.color(redColor).fontFamily(semibold).size(16).make(),
    5.heightBox,
    TextFormField(
      decoration: const InputDecoration(
          hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
          hintText: emailHint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: redColor))),
    ),
    5.heightBox
  ]);
}
