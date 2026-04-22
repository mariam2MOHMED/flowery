import 'package:flowerecommeric/feature/home/domain/entity/product_entity.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/best_seller_item.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_cubit.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/app_colors.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child:
      BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {

          if (state.homeStatus.isSuccess && state.homeStatus.data !=null) {
            final bestSeller = state.homeStatus.data!.bestSeller;
            return ListView.separated(
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return BestSellerItem(
                  price: bestSeller[index].price!,
                  title: bestSeller[index].title!,
                  image: bestSeller[index].imgCover!,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12.0);
              },
              itemCount: bestSeller.length,
            );
          } else {
            final isLoading =
                state.homeStatus.isLoading || state.homeStatus.isInitial;
            final bestSellers = List.generate(
              6,
              (_) => const ProductEntity(
                price: 0,
                imgCover: 'placeholder',
                title: 'Loading',
              ),
            );

            return Skeletonizer(
              enabled: isLoading,

              containersColor: AppColors.lightPink,
              effect: const ShimmerEffect(
                baseColor: AppColors.lightPink,
                highlightColor: Colors.white,
                duration: Duration(milliseconds: 1200),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  return BestSellerItem(
                    price: bestSellers[index].price!,
                    title: bestSellers[index].title!,
                    image: bestSellers[index].imgCover!,
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 12.0);
                },
                itemCount: bestSellers.length,
              ),
            );
          }
        },
      ),

    );
  }
}
