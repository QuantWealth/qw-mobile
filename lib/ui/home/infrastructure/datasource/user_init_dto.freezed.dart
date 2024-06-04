// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_init_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInitDto _$UserInitDtoFromJson(Map<String, dynamic> json) {
  return _UserInitDto.fromJson(json);
}

/// @nodoc
mixin _$UserInitDto {
  String get id => throw _privateConstructorUsedError;
  String get wallet => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  bool get deployed => throw _privateConstructorUsedError;
  List<String> get providers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInitDtoCopyWith<UserInitDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInitDtoCopyWith<$Res> {
  factory $UserInitDtoCopyWith(
          UserInitDto value, $Res Function(UserInitDto) then) =
      _$UserInitDtoCopyWithImpl<$Res, UserInitDto>;
  @useResult
  $Res call(
      {String id,
      String wallet,
      String network,
      bool deployed,
      List<String> providers});
}

/// @nodoc
class _$UserInitDtoCopyWithImpl<$Res, $Val extends UserInitDto>
    implements $UserInitDtoCopyWith<$Res> {
  _$UserInitDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wallet = null,
    Object? network = null,
    Object? deployed = null,
    Object? providers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      deployed: null == deployed
          ? _value.deployed
          : deployed // ignore: cast_nullable_to_non_nullable
              as bool,
      providers: null == providers
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInitDtoImplCopyWith<$Res>
    implements $UserInitDtoCopyWith<$Res> {
  factory _$$UserInitDtoImplCopyWith(
          _$UserInitDtoImpl value, $Res Function(_$UserInitDtoImpl) then) =
      __$$UserInitDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String wallet,
      String network,
      bool deployed,
      List<String> providers});
}

/// @nodoc
class __$$UserInitDtoImplCopyWithImpl<$Res>
    extends _$UserInitDtoCopyWithImpl<$Res, _$UserInitDtoImpl>
    implements _$$UserInitDtoImplCopyWith<$Res> {
  __$$UserInitDtoImplCopyWithImpl(
      _$UserInitDtoImpl _value, $Res Function(_$UserInitDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? wallet = null,
    Object? network = null,
    Object? deployed = null,
    Object? providers = null,
  }) {
    return _then(_$UserInitDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      deployed: null == deployed
          ? _value.deployed
          : deployed // ignore: cast_nullable_to_non_nullable
              as bool,
      providers: null == providers
          ? _value._providers
          : providers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInitDtoImpl extends _UserInitDto {
  const _$UserInitDtoImpl(
      {required this.id,
      required this.wallet,
      required this.network,
      required this.deployed,
      required final List<String> providers})
      : _providers = providers,
        super._();

  factory _$UserInitDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInitDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String wallet;
  @override
  final String network;
  @override
  final bool deployed;
  final List<String> _providers;
  @override
  List<String> get providers {
    if (_providers is EqualUnmodifiableListView) return _providers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providers);
  }

  @override
  String toString() {
    return 'UserInitDto(id: $id, wallet: $wallet, network: $network, deployed: $deployed, providers: $providers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInitDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.deployed, deployed) ||
                other.deployed == deployed) &&
            const DeepCollectionEquality()
                .equals(other._providers, _providers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, wallet, network, deployed,
      const DeepCollectionEquality().hash(_providers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInitDtoImplCopyWith<_$UserInitDtoImpl> get copyWith =>
      __$$UserInitDtoImplCopyWithImpl<_$UserInitDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInitDtoImplToJson(
      this,
    );
  }
}

abstract class _UserInitDto extends UserInitDto {
  const factory _UserInitDto(
      {required final String id,
      required final String wallet,
      required final String network,
      required final bool deployed,
      required final List<String> providers}) = _$UserInitDtoImpl;
  const _UserInitDto._() : super._();

  factory _UserInitDto.fromJson(Map<String, dynamic> json) =
      _$UserInitDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get wallet;
  @override
  String get network;
  @override
  bool get deployed;
  @override
  List<String> get providers;
  @override
  @JsonKey(ignore: true)
  _$$UserInitDtoImplCopyWith<_$UserInitDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
