// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginState _$$_LoginStateFromJson(Map<String, dynamic> json) =>
    _$_LoginState(
      formState:
          UserCredential.fromJson(json['form_state'] as Map<String, dynamic>),
      savedCredentialList: (json['saved_credential_list'] as List<dynamic>)
          .map((e) => UserCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
      rememberCredentials: json['remember_credentials'] as bool? ?? false,
    );

Map<String, dynamic> _$$_LoginStateToJson(_$_LoginState instance) =>
    <String, dynamic>{
      'form_state': instance.formState,
      'saved_credential_list': instance.savedCredentialList,
      'remember_credentials': instance.rememberCredentials,
    };
