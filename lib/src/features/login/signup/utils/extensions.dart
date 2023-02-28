import 'package:country_code_picker/country_code.dart';
import 'package:fifa/src/features/login/signup/utils/constants.dart';

extension CountryCodeX on CountryCode {
  int? get id => countryData.firstWhere(
        (country) => country['code'] == code?.toLowerCase(),
        orElse: () => <String, dynamic>{},
      )['id'] as int?;
}

String? countryNameFromId(int? id) {
  if (id!=null) {
    return countryData.firstWhere(
      (country) => country['id'] as int == id,
      orElse: () => <String, dynamic>{},
    )['name'] as String?;
  }
}
