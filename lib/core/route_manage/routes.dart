import 'package:flowerecommeric/core/route_manage/app_routes.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';


abstract class Routes{
  static Route onGenerate(RouteSettings setting){
    final url=Uri.parse(setting.name ??'/');
    switch(url.path){
      case AppRoutes.home:
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