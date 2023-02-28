import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

DateTime? birthDate({int? birthYear, int? birthMonth, int? birthDay}) {
  if (birthYear == null) return null;
  return DateTime(birthYear, (birthMonth ?? 0) + 1, birthDay ?? 0);
}

/// Used for unwrapping an Either Left as an Exception. Useful when catching the exception is preferred to delaing
/// with Sum types.
R getOrThrow<L extends Exception, R>(Either<L, R> either) => either.getOrElse((l) => throw l);

FormFieldValidator<String>? isNullOrEmptyValidator(BuildContext context) => (String? fieldCurrentText) {
      if (fieldCurrentText.isNullOrEmpty) {
        return context.l10n.fieldMustNotBeEmptyText;
      }
    };

/// Evaluate the binary logarithm of an integer number.
/// Two-step method using a De Bruijn-like sequence table lookup.
/// This method is used to calculate tournaments rounds from the number of participants

int log2(int number) {
  number |= number >> 1;
  number |= number >> 2;
  number |= number >> 4;
  number |= number >> 8;
  number |= number >> 16;
  number |= number >> 32;

  return multiplyDeBruijnBitPosition[((number - (number >> 1)) * 0x07EDD5E59A4E28C2) >> 58];
}

List<int> multiplyDeBruijnBitPosition = [
  63,
  0,
  58,
  1,
  59,
  47,
  53,
  2,
  60,
  39,
  48,
  27,
  54,
  33,
  42,
  3,
  61,
  51,
  37,
  40,
  49,
  18,
  28,
  20,
  55,
  30,
  34,
  11,
  43,
  14,
  22,
  4,
  62,
  57,
  46,
  52,
  38,
  26,
  32,
  41,
  50,
  36,
  17,
  19,
  29,
  10,
  13,
  21,
  56,
  45,
  25,
  31,
  35,
  16,
  9,
  12,
  44,
  24,
  15,
  8,
  23,
  7,
  6,
  5
];
