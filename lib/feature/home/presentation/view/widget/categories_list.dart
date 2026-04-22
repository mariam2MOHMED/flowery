import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/feature/home/domain/entity/category_entity.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/category_item.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_cubit.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.homeStatus.isSuccess) {
          return SizedBox(
            height: 100.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = state.homeStatus.data!.categories;
                return CategoryItem(
                  image: category[index].image!,
                  title: category[index].name!,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10.0);
              },
              itemCount: state.homeStatus.data!.categories.length,
            ),
          );
        } else {
          final isLoading =
              state.homeStatus.isLoading || state.homeStatus.isInitial;
          final categories = List.generate(
            6,
            (index) =>
                const CategoryEntity(image: 'placeholder', name: 'Loading'),
          );

          return Skeletonizer(
            enabled: isLoading,
            containersColor: AppColors.lightPink,
            effect:const ShimmerEffect(
              baseColor: AppColors.lightPink,
              highlightColor: Colors.white,
              duration:  Duration(milliseconds: 1200),
            ) ,
            child: SizedBox(
              height: 100.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    image: categories[index].image!,
                    title: categories[index].name!,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10.0),
                itemCount: categories.length,
              ),
            ),
          );
        }
      },
    );
  }
}
