import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
extension AppLocalizationExtenstion on BuildContext {
  AppLocalizations get loc =>
      AppLocalizations.of(this)!;  // this mean the object after on(Build Context)
}