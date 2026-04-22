import 'package:flowerecommeric/feature/home/domain/entity/category_entity.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/occasion_item.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_cubit.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/app_colors.dart';

class OccassionList extends StatelessWidget {
  const OccassionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child:
      BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {

          if (state.homeStatus.isSuccess && state.homeStatus.data !=null) {
            final occassions = state.homeStatus.data!.occasions;
            return ListView.separated(
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return OccasionItem(
                  title: occassions[index].name!,
                  image: occassions[index].image!,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12.0);
              },
              itemCount: occassions.length,
            );
          } else {
            final isLoading =
                state.homeStatus.isLoading || state.homeStatus.isInitial;
            final occasion = List.generate(
              6,
                  (_) => const CategoryEntity(

                image: 'placeholder',
                name: 'Loading',
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
                  return OccasionItem(
                    title: occasion[index].name!,
                    image: occasion[index].image!,
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(width: 12.0);
                },
                itemCount: occasion.length,
              ),
            );
          }
        },
      ),

    );
  }
}