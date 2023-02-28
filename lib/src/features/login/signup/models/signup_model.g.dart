// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignupModel _$$_SignupModelFromJson(Map<String, dynamic> json) =>
    _$_SignupModel(
      username: json['username'] as String?,
      email: json['email'] as String?,
      countryId: json['country_id'] as int?,
      password: json['password'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      console: json['console'] as int?,
      gamerTag: json['gamer_tag'] as String?,
      birthDay: json['birth_day'] as int?,
      birthMonth: json['birth_month'] as int?,
      birthYear: json['birth_year'] as int?,
    );

Map<String, dynamic> _$$_SignupModelToJson(_$_SignupModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'country_id': instance.countryId,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'console': instance.console,
      'gamer_tag': instance.gamerTag,
      'birth_day': instance.birthDay,
      'birth_month': instance.birthMonth,
      'birth_year': instance.birthYear,
    };
