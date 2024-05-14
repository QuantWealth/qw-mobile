import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_dto.freezed.dart';
part 'asset_dto.g.dart';

@freezed
class AssetDto with _$AssetDto {
  const AssetDto._();

  const factory AssetDto({
    required String name,
    required String symbol,
    required String address,
    required int quantity,
    required double fiatPrice,
    required String network,
    required int totalCount,
  }) = _AssetDto;

  factory AssetDto.fromJson(Map<String, Object?> json) =>
      _$AssetDtoFromJson(json);
}
