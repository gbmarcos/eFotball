// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResetPassData _$$_ResetPassDataFromJson(Map<String, dynamic> json) =>
    _$_ResetPassData(
      forgotPasswordID: json['forgot_password_i_d'] as int,
      userID: json['user_i_d'] as int,
      forgotPasswordToken: json['forgot_password_token'] as String,
    );

Map<String, dynamic> _$$_ResetPassDataToJson(_$_ResetPassData instance) =>
    <String, dynamic>{
      'forgot_password_i_d': instance.forgotPasswordID,
      'user_i_d': instance.userID,
      'forgot_password_token': instance.forgotPasswordToken,
    };
