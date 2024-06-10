import 'package:freezed_annotation/freezed_annotation.dart';

part 'approved_tx_dto.freezed.dart';
part 'approved_tx_dto.g.dart';

@freezed
class ApprovedTxDto with _$ApprovedTxDto {
  const ApprovedTxDto._();

  const factory ApprovedTxDto({
    required String typedData,
    required MetaTxData txData,
  }) = _ApprovedTxDto;

  factory ApprovedTxDto.fromJson(Map<String, Object?> json) =>
      _$ApprovedTxDtoFromJson(json);
}

@freezed
class MetaTxData with _$MetaTxData {
  const MetaTxData._();

  const factory MetaTxData({
    required String to,
    required String data,
    required String value,
  }) = _MetaTxData;

  factory MetaTxData.fromJson(Map<String, Object?> json) =>
      _$MetaTxDataFromJson(json);
}
