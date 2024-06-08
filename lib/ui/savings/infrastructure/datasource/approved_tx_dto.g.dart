// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approved_tx_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApprovedTxDtoImpl _$$ApprovedTxDtoImplFromJson(Map<String, dynamic> json) =>
    _$ApprovedTxDtoImpl(
      typedData: json['typedData'] as String,
      txData: MetaTxData.fromJson(json['txData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApprovedTxDtoImplToJson(_$ApprovedTxDtoImpl instance) =>
    <String, dynamic>{
      'typedData': instance.typedData,
      'txData': instance.txData,
    };

_$MetaTxDataImpl _$$MetaTxDataImplFromJson(Map<String, dynamic> json) =>
    _$MetaTxDataImpl(
      to: json['to'] as String,
      data: json['data'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$MetaTxDataImplToJson(_$MetaTxDataImpl instance) =>
    <String, dynamic>{
      'to': instance.to,
      'data': instance.data,
      'value': instance.value,
    };
