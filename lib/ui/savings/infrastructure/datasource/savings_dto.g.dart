// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavingsDtoImpl _$$SavingsDtoImplFromJson(Map<String, dynamic> json) =>
    _$SavingsDtoImpl(
      investedAmount: (json['investedAmount'] as num).toDouble(),
      apy: (json['apy'] as num).toDouble(),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      type: json['type'] as String,
      strategy: (json['strategy'] as num).toInt(),
      description: json['description'] as String,
      graph: json['graph'] as List<dynamic>,
      identifier: json['identifier'] as String,
    );

Map<String, dynamic> _$$SavingsDtoImplToJson(_$SavingsDtoImpl instance) =>
    <String, dynamic>{
      'investedAmount': instance.investedAmount,
      'apy': instance.apy,
      'currentAmount': instance.currentAmount,
      'type': instance.type,
      'strategy': instance.strategy,
      'description': instance.description,
      'graph': instance.graph,
      'identifier': instance.identifier,
    };
