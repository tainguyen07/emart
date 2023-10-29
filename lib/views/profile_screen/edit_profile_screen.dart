import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/images.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widget_common/bg_widget.dart';
import 'package:emart_app/widget_common/custom_textfield.dart';
import 'package:emart_app/widget_common/ourButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.newpassController.text = data['password'];
    return bgWidget(Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make()
                : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                color: redColor,
                onPress: () async {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Change"),
            const Divider(),
            20.heightBox,
            customTextField(
                hint: nameHint,
                title: name,
                controller: controller.nameController),
            10.heightBox,
            customTextField(
                hint: password,
                title: oldpassword,
                controller: controller.oldpassController),
            10.heightBox,
            customTextField(
                hint: password,
                title: newpassword,
                controller: controller.newpassController),
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                  color: redColor,
                  onPress: () async {
                    controller.isloading(true);
                    if (controller.profileImgPath.isNotEmpty) {
                      await controller.uploadProfileImage();
                    } else {
                      controller.profileImageLink = data['imageUrl'];
                    }
                    if (data['password'] == controller.oldpassController.text) {
                      await controller.changeAuthPassword(
                          emai: data['email'],
                          password: controller.oldpassController.text,
                          newpassword: controller.newpassController.text);
                      await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.newpassController.text);
                      VxToast.show(context, msg: "Updated");
                    } else {
                      VxToast.show(context, msg: "Wrong old password");
                      controller.isloading(false);
                    }
                  },
                  title: "Save"),
            )
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50))
            .make(),
      ),
    ));
  }
}
