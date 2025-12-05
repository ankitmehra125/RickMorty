import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty/common/common_ui.dart';
import 'package:rick_morty/common/custom_appbar.dart';
import 'package:rick_morty/global.dart';
import 'package:rick_morty/lang/strings.dart';
import 'package:rick_morty/pages/character/character_controller.dart';

/// A view class for displaying character-related UI.
class CharacterView extends StatelessWidget {
   CharacterView({super.key});

   final controller = Get.find<CharacterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.textCharacters.tr,
      ),
      body: Obx((){
        if(controller.characterList.isEmpty){
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
              return CommonUi.customShimmer();
            },
          );
        }
        return ListView.builder(
          itemCount: controller.characterList.length,
          itemBuilder: (context,index){
            var item = controller.characterList[index];
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: Global.appHzPadding,vertical: 10),
              decoration: CommonUi.customBoxDecoration(),
              child: Row(
                children: [
                  CommonUi.customNetworkImage(
                    imageUrl: item.image ?? ""
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id:  ${item.id}",style: CommonUi.customTextStyle(),),
                        Text("Name:  ${item.name}",style: CommonUi.customTextStyle(),),
                        Text("Status:  ${item.status}",style: CommonUi.customTextStyle(),),
                        Text("species:  ${item.species}",style: CommonUi.customTextStyle(),),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}