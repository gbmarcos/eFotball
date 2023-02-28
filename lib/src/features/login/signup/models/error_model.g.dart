// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignupErrors _$$_SignupErrorsFromJson(Map<String, dynamic> json) =>
    _$_SignupErrors(
      emailError: json['email_error'] as String?,
      usernameError: json['username_error'] as String?,
    );

Map<String, dynamic> _$$_SignupErrorsToJson(_$_SignupErrors instance) =>
    <String, dynamic>{
      'email_error': instance.emailError,
      'username_error': instance.usernameError,
    };
