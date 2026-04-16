import 'package:flowerecommeric/core/extension/localialization_extensions.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Validator {
  Validator._();

  static String? validateEmail(BuildContext context, String? val) {
    if (val == null || val.trim().isEmpty) {
      return context.loc.emailRequired;
    } else if (!RegExp(Constants.emailPattern).hasMatch(val)) {
      return context.loc.emailNotValid;
    } else {
      return null;
    }
  }

  static String? validatePassword(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.loc.passwordRequired;
    }

    if (val.length < 8) {
      return context.loc.passwordMinLength;
    }


    if (!RegExp(r'[A-Z]').hasMatch(val)) {
      return context.loc.passwordUppercase;
    }


    if (!RegExp(r'[a-z]').hasMatch(val)) {
      return context.loc.passwordMustContainLowerCase;
    }


    if (!RegExp(r'[0-9]').hasMatch(val)) {
      return context.loc.passwordNumber;
    }


    if (!RegExp(r'[#?!@$%^&*-]').hasMatch(val)) {
      return context.loc.passwordMustContainSpecialChar;
    }

    return null;
  }

  static String? validateConfirmPassword(
      BuildContext context, String? val, String? password) {
    if (val == null || val.isEmpty) {
      return context.loc.fieldRequired;
    } else if (val != password) {
      return context.loc.passwordsNotMatch;
    } else {
      return null;
    }
  }

  static String? validateUsername(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.loc.usernameRequired;
    } else if (!RegExp(Constants.usernamePattern).hasMatch(val)) {
      return context.loc.usernameNotValid;
    } else {
      return null;
    }
  }

  static String? validateFullName(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.loc.fullnameRequired;
    }
    if (val.trim().length < 3) {
      return context.loc.fullnameMinLength;
    } else {
      return null;
    }
  }
  static String? firstNameValidation(BuildContext context,String? value) {


    if (value == null || value.isEmpty) {
      return context.loc.firstNameRequired;
    }
    if (value.length < 3) {
      return context.loc.firstNameTooShort;
    }


    return null;
  }
  static String? lastNameValidation(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.loc.lastNameRequired;
    }
    if (value.length < 3) {
      return context.loc.lastNameTooShort;
    }
    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.loc.phoneRequired;
    } else if (int.tryParse(val.trim()) == null) {
      return context.loc.phoneNumbersOnly;
    } else if (val.trim().length != 13) {
      return context.loc.phoneLength;
    } else {
      return null;
    }
  }

  static String? validateNumber(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return context.loc.numberRequired;
    } else if (int.tryParse(val.trim()) == null) {
      return context.loc.numberOnly;
    } else {
      return null;
    }
  }
}