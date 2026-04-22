import 'package:flowerecommeric/core/di/di.dart';
import 'package:flowerecommeric/core/l10n/app_localizations.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/address_section.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/best_seller_list.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/categories_list.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/occassion_list.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/title_header.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_cubit.dart';
import 'package:flowerecommeric/feature/home/presentation/view_model/home/home_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search_header.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (_) =>
              getIt<HomeCubit>()..doIntent(intent: const GetHomeData()),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              const SearchHeader(),
              const SizedBox(height: 16.0),
              const AddressSection(),
              const SizedBox(height: 17.0),
              TitleHeader(
                title: AppLocalizations.of(context)!.categories,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
              const CategoriesList(),
              const SizedBox(height: 24.0),
              TitleHeader(
                title: AppLocalizations.of(context)!.bestSeller,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),
              const BestSellerList(),
              const SizedBox(height: 24.0),
              TitleHeader(
                title: AppLocalizations.of(context)!.occasion,
                onTap: () {},
              ),
              const SizedBox(height: 16.0),

              const OccassionList(),
            ],
          ),
        ),
      ),
    );
  }
}
