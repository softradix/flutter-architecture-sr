import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/decoration/common_text_styles.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/image_assets/asset.dart';
import 'package:flutter_clean_architecture_pattren/core/common_ui/image_assets/asset_widget.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/app_constants.dart';
import 'package:flutter_clean_architecture_pattren/core/theme/color_style/app_color_palette.dart';
import 'package:flutter_clean_architecture_pattren/core/constant_strings/string_resources.dart';
import 'package:flutter_clean_architecture_pattren/features/home/presentation/screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension HomeScreenExtension on HomeScreen{

  // This function returns a widget, which builds the Product listview.
  productListView() {
    var productList = controller.productList;
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: productList.length,
        itemBuilder: (context,index){
          return Container(
            width: 1.sw,
            decoration: BoxDecoration(
                color: lightColorPalette.whiteColorPrimary.shade900,
                borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(children: [
                      AssetWidget(
                        asset: Asset(type: AssetType.network, path:productList[index].image),
                        height: 126.h,
                        width: 126.w,
                      ),
                      SizedBox(height: 20.h,),
                      Text(
                        "${StringsResources.price.tr}: ${AppConstants.currency}${productList[index].price}",
                        style: SmallButtonLabel(
                            context: context,
                            color: lightColorPalette.redSwatch.shade900),
                      )
                    ],).paddingOnly(right: 10.w),
                    Flexible(
                      child: Text(
                        "${productList[index].description}",
                        style: SmallButtonLabel(
                            context: context,
                            color: lightColorPalette.primarySwatch.shade900),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 12.w,right: 12.w,bottom: 10.h,top: 10.h),
                Text(
                  productList[index].title,
                  style: SmallButtonLabel(
                      context: context,
                      color: lightColorPalette.secondarySwatch.shade900),
                ).paddingOnly(left: 12.w,bottom: 10.h,right: 12.w),

              ],
            ),
          ).paddingOnly(left: 20.w,right: 20.w,bottom: 20.h);
        });
  }
}