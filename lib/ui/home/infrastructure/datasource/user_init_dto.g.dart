// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_init_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInitDtoImpl _$$UserInitDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserInitDtoImpl(
      id: json['id'] as String,
      wallet: json['wallet'] as String,
      network: json['network'] as String,
      deployed: json['deployed'] as bool,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserInitDtoImplToJson(_$UserInitDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wallet': instance.wallet,
      'network': instance.network,
      'deployed': instance.deployed,
      'providers': instance.providers,
    };
