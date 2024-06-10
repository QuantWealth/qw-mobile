import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_dto.freezed.dart';
part 'savings_dto.g.dart';

@freezed
class SavingsDto with _$SavingsDto {
  const SavingsDto._();

  const factory SavingsDto({
    required double investedAmount,
    required double apy,
    required double currentAmount,
    required String type,
    required int strategy,
    required String description,
    required List<dynamic> graph,
    required String identifier,
  }) = _SavingsDto;

  factory SavingsDto.fromJson(Map<String, Object?> json) =>
      _$SavingsDtoFromJson(json);

  String get name => type == 'flexi' ? 'Flexi' : 'Fixed';

  String get apiName => type == 'flexi' ? 'flexi' : 'fixed';
}
