// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetDtoImpl _$$AssetDtoImplFromJson(Map<String, dynamic> json) =>
    _$AssetDtoImpl(
      name: json['contract_name'] as String? ?? 'Unnamed',
      symbol: json['contract_ticker_symbol'] as String? ?? 'N/A',
      decimals: (json['contract_decimals'] as num?)?.toInt() ?? 18,
      address: json['contract_address'] as String,
      balance: json['balance'] as String,
      logoUrl: json['logo_url'] as String,
      logoUrls: LogoUrls.fromJson(json['logo_urls'] as Map<String, dynamic>),
      rate: (json['quote_rate'] as num?)?.toDouble() ?? 0.0,
      rate24h: (json['quote_rate_24h'] as num?)?.toDouble() ?? 0.0,
      quote: (json['quote'] as num?)?.toDouble() ?? 0.0,
      quote24h: (json['quote_24h'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$AssetDtoImplToJson(_$AssetDtoImpl instance) =>
    <String, dynamic>{
      'contract_name': instance.name,
      'contract_ticker_symbol': instance.symbol,
      'contract_decimals': instance.decimals,
      'contract_address': instance.address,
      'balance': instance.balance,
      'logo_url': instance.logoUrl,
      'logo_urls': instance.logoUrls,
      'quote_rate': instance.rate,
      'quote_rate_24h': instance.rate24h,
      'quote': instance.quote,
      'quote_24h': instance.quote24h,
    };

_$LogoUrlsImpl _$$LogoUrlsImplFromJson(Map<String, dynamic> json) =>
    _$LogoUrlsImpl(
      tokenLogo: json['token_logo_url'] as String,
      chainLogo: json['chain_logo_url'] as String,
    );

Map<String, dynamic> _$$LogoUrlsImplToJson(_$LogoUrlsImpl instance) =>
    <String, dynamic>{
      'token_logo_url': instance.tokenLogo,
      'chain_logo_url': instance.chainLogo,
    };
