import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_cart.dart';
import 'package:emart_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              if (snapshot.data!.docs.isEmpty) {
                // Get.put(AuthController().signoutMethod(context));
                return Center(
                  child: OutlinedButton(
                      onPressed: () async {
                        await Get.put(AuthController().signoutMethod(context));
                        Get.offAll(LoginScreen());
                      },
                      child: "Log out".text.fontFamily(semibold).black.make()),
                );
              }
              var data = snapshot.data!.docs.first;
              return SafeArea(
                  child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.edit,
                      color: whiteColor,
                    ),
                  ).onTap(() {
                    controller.nameController.text = data['name'];

                    Get.to(EditProfileScreen(data: data));
                  }),
                  Row(
                    children: [
                      data['imageUrl'] == ''
                          ? Image.asset(imgProfile2,
                                  width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                          : Image.network(data['imageUrl'],
                                  width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                      10.widthBox,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${data['name']}"
                              .text
                              .fontFamily(semibold)
                              .white
                              .make(),
                          "${data['email']}".text.white.make()
                        ],
                      )),
                      OutlinedButton(
                          onPressed: () async {
                            await Get.put(
                                AuthController().signoutMethod(context));
                            Get.offAll(LoginScreen());
                          },
                          child:
                              "Log out".text.fontFamily(semibold).white.make())
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                          count: "${data['cart_count']}",
                          title: "in your cart",
                          width: context.screenWidth / 3.5),
                      detailsCard(
                          count: "${data['wishlist_count']}",
                          title: "in your wishlist",
                          width: context.screenWidth / 3.5),
                      detailsCard(
                          count: "${data['order_count']}",
                          title: "your order",
                          width: context.screenWidth / 3.5)
                    ],
                  ),
                  10.heightBox,
                  ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 22,
                              ),
                              title: profileButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profileButtonList.length)
                      .box
                      .white
                      .rounded
                      .margin(const EdgeInsets.all(12))
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .shadowSm
                      .make()
                      .box
                      .color(redColor)
                      .make()
                ]),
              ));
            }
          }),
    ));
  }
}
