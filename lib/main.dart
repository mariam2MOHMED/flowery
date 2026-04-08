import 'package:device_preview/device_preview.dart';
import 'package:flowerecommeric/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(DevicePreview(

      builder: (_)=>const Flowery()));
}

class Flowery extends StatelessWidget {
  const Flowery({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(AppLocalizations.of(context)!.localeName),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      )
    );

  }
}

