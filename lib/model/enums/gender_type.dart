enum GenderType {
  male,
  female,
}

extension GenderTypeExtension on GenderType {
  static GenderType? fromString(String text) {
    if (text == "male" || text == "Nam") {
      return GenderType.male;
    } else if (text == "female" || text == "Nữ") {
      return GenderType.female;
    }
    return null;
  }

  String get vnText {
    switch (this) {
      case GenderType.male:
        return 'Nam';
      case GenderType.female:
        return 'Nữ';
      default:
        return '';
    }
  }

  String get enText {
    switch (this) {
      case GenderType.male:
        return 'Male';
      case GenderType.female:
        return 'Female';
      default:
        return '';
    }
  }
}
