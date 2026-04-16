enum Gender {
  male,
  female;

  String get apiValue {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}