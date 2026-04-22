import 'package:flowerecommeric/core/theme/app_colors.dart';
import 'package:flowerecommeric/core/theme/font_style.dart';
import 'package:flutter/cupertino.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("CartTab",style: getBoldStyle(color: AppColors.pink,fontSize: 70),),
    );
  }
}
