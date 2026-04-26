import 'package:flowerecommeric/feature/home/presentation/view/widget/custom_product_card.dart';
import 'package:flowerecommeric/feature/home/presentation/view/widget/home_section_header.dart';
import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../domain/entity/product_entity.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key, required this.bestSeller});

  final List<ProductEntity> bestSeller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0
        ),
        child: Column(
          children: [
            const SizedBox(height: 50.5),
            HomeSectionHeader(
              title: AppLocalizations.of(context)!.bestSeller,
              subTitle: AppLocalizations.of(
                context,
              )!.bloomWithOurExquisitebestSellers,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsetsDirectional.only(
                  top: 20.0
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 163/240
                ),
                itemCount: bestSeller.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: CustomProductCard(productEntity: bestSeller[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
