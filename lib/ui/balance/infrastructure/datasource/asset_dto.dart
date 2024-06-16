import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_dto.freezed.dart';
part 'asset_dto.g.dart';

@freezed
class AssetDto with _$AssetDto {
  const AssetDto._();

  const factory AssetDto({
    @JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
    required String name,
    @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
    required String symbol,
    @JsonKey(name: 'contract_decimals', defaultValue: 18) required int decimals,
    @JsonKey(name: 'contract_address') required String address,
    required String balance,
    @JsonKey(name: 'logo_url') required String logoUrl,
    @JsonKey(name: 'logo_urls') required LogoUrls logoUrls,
    @JsonKey(name: 'quote_rate', defaultValue: .0) required double rate,
    @JsonKey(name: 'quote_rate_24h', defaultValue: .0) required double rate24h,
    @JsonKey(name: 'quote', defaultValue: .0) required double quote,
    @JsonKey(name: 'quote_24h', defaultValue: .0) required double quote24h,
  }) = _AssetDto;

  factory AssetDto.fromJson(Map<String, Object?> json) =>
      _$AssetDtoFromJson(json);

  int get balanceAmount =>
      (BigInt.parse(balance) ~/ BigInt.from(10).pow(decimals)).toInt();

  double get fiatPrice => quote;
}

@freezed
class LogoUrls with _$LogoUrls {
  const LogoUrls._();

  const factory LogoUrls({
    @JsonKey(name: 'token_logo_url') required String tokenLogo,
    @JsonKey(name: 'chain_logo_url') required String chainLogo,
  }) = _LogoUrls;

  factory LogoUrls.fromJson(Map<String, Object?> json) =>
      _$LogoUrlsFromJson(json);
}
