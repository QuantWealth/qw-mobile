import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_init_dto.freezed.dart';
part 'user_init_dto.g.dart';

@freezed
class UserInitDto with _$UserInitDto {
  const UserInitDto._();

  const factory UserInitDto({
    required String id,
    required String wallet,
    required String network,
    required bool deployed,
    required List<String> providers,
  }) = _UserInitDto;

  factory UserInitDto.fromJson(Map<String, Object?> json) =>
      _$UserInitDtoFromJson(json);
}
