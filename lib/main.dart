//import 'package:device_preview/device_preview.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flowerecommeric/core/di/di.dart';
import 'package:flowerecommeric/core/route_manage/app_routes.dart';
import 'package:flowerecommeric/core/route_manage/routes.dart';
import 'package:flowerecommeric/core/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS; // أو Android

  await configureDependencies();
  runApp(
     DevicePreview(
       builder: (_)=>
      const Flowery()
  )
  );
}

class Flowery extends StatelessWidget {
  const Flowery({super.key});

  @override
  Widget build(BuildContext context) {



        return MaterialApp(

          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.signup,
          theme: AppTheme.lightTheme,
          onGenerateRoute: Routes.onGenerate,
          locale: const Locale('en'),
          localizationsDelegates:
          AppLocalizations.localizationsDelegates,
          supportedLocales:
          AppLocalizations.supportedLocales,
        );


  }
}
