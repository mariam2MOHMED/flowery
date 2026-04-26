import 'package:flowerecommeric/core/route_manage/app_routes.dart';
import 'package:flowerecommeric/feature/auth/presentation/screens/login/login_screen.dart';
import 'package:flowerecommeric/feature/auth/presentation/screens/register/signup_screen.dart';
import 'package:flowerecommeric/feature/home/domain/entity/product_entity.dart';
import 'package:flowerecommeric/feature/home/presentation/view/screens/best_seller_screen.dart';
import 'package:flowerecommeric/feature/home/presentation/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/screens/forget_password/forgget_password_screen.dart';
import '../l10n/app_localizations.dart';


abstract class Routes{
  static Route onGenerate(RouteSettings setting){
    final url=Uri.parse(setting.name ??'/');
    switch(url.path){
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (context )=>
        const SignupScreen());
      case AppRoutes.bestSeller:
        final bestSellers=setting.arguments as List<ProductEntity>;
        return MaterialPageRoute(builder: (context )=>
         BestSellerScreen(
          bestSeller: bestSellers,
        ));
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context )=>
        const HomeScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context )=>
        const ForggetPasswordScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context )=>
        const LoginScreen());
      default:
        return MaterialPageRoute(builder: (context )=>Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.noRouteFound)
              ],
            ),
          ),
        ));
    }
  }
}