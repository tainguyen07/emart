import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widget_common/ourButton.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      itemCount: 3,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "3000".text.color(redColor).fontFamily(bold).size(18).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "In house brands"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make()
                        ],
                      )),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  ).box.height(70).color(textfieldGrey).make(),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(EdgeInsets.symmetric(horizontal: 6))
                                    .make()),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //Color
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove)),
                            "0".text.size(16).make(),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          ])
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //Total
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.make(),
                          ),
                          "0.00".text.color(redColor).make()
                        ],
                      ).box.padding(EdgeInsets.all(8)).shadowSm.make(),

                      //Description
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "This is dummy item and dummy descirption here ..."
                          .text
                          .color(darkFontGrey)
                          .make(),

                      ListView(
                        shrinkWrap: true,
                        children: List.generate(
                            5,
                            (index) => ListTile(
                                  title: "Video ".text.semiBold.make(),
                                  trailing: Icon(Icons.arrow_forward),
                                )),
                      )
                    ],
                  ).box.white.shadowSm.make()
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add Item"),
          ),
          10.heightBox.color(redColor)
        ],
      ),
    );
  }
}
