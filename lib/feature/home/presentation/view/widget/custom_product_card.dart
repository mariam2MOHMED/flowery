import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_manager.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';

import 'package:flowerecommeric/feature/home/domain/entity/product_entity.dart';
import 'package:flutter/cupertino.dart' ;
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key,
    required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8.0),
        border: Border.all(
          color: AppColors.midGray
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: CachedNetworkImage(imageUrl: productEntity.imgCover!,
            width:double.infinity,
              height: 131.0,
              fit: BoxFit.cover,
            ),

          ),
          const SizedBox(height: 8.0,),
          Text(productEntity.title!,
            maxLines: 1,

            style: getMediumStyle(color: AppColors.black).copyWith(
              overflow: TextOverflow.ellipsis,

            ),),
          const SizedBox(height: 4.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppLocalizations.of(context)!.egp} ${productEntity.price}',
                maxLines: 1,
                style: getBoldStyle(color: AppColors.black,
                fontSize: FontSize.s14
                ).copyWith(
                  overflow: TextOverflow.ellipsis,

                )
              ),

              Text(
                '${productEntity.priceAfterDiscount}',
                style: getMediumStyle(color: AppColors.gray,

                )
              ),

              Text(
                '${productEntity.discount} %',
    style: getMediumStyle(color: AppColors.green,
      ),)

            ],
          ),
          const SizedBox(height: 8.0,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                minimumSize: const Size(double.infinity, 30.0)
            ),
            onPressed: (){
            },
            child: FittedBox(
              child: Row(
                children: [
                  const  Icon(CupertinoIcons.cart,color: AppColors.white,),
                  const SizedBox(width: 7.0,),
                  Text(AppLocalizations.of(context)!.addToCart,
                    style: getMediumStyle(color: AppColors.white,
                        fontSize: FontSize.s13
                    ),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
