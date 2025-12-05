import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_morty/common/app_colors.dart';
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
        return controller.characterLoading.value ? ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return CommonUi.customShimmer();
          },
        )  :
        SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          physics: const ClampingScrollPhysics(),
          header: MaterialClassicHeader(color: AppColors.colorPrimary,),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              if (mode == LoadStatus.loading) {
                return CommonUi.loadingIndicator();
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          reverse: false,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          child: controller.characterList.isEmpty ?
           Center(child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.error_outline, size: 50, color: AppColors.colorPrimary),
               SizedBox(height: 10),
               Text(Strings.textNoCharacters.tr,style: CommonUi.customTextStyle())
             ],
           )) :
          ListView.builder(
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
          )
        );
      }),
    );
  }
}