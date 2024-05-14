// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetDtoImpl _$$AssetDtoImplFromJson(Map<String, dynamic> json) =>
    _$AssetDtoImpl(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      address: json['address'] as String,
      quantity: (json['quantity'] as num).toInt(),
      fiatPrice: (json['fiatPrice'] as num).toDouble(),
      network: json['network'] as String,
      totalCount: (json['totalCount'] as num).toInt(),
      percentageChange: (json['percentageChange'] as num).toDouble(),
      totalBalance: (json['totalBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$$AssetDtoImplToJson(_$AssetDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'address': instance.address,
      'quantity': instance.quantity,
      'fiatPrice': instance.fiatPrice,
      'network': instance.network,
      'totalCount': instance.totalCount,
      'percentageChange': instance.percentageChange,
      'totalBalance': instance.totalBalance,
    };
