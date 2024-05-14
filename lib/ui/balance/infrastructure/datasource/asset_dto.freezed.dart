// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetDto _$AssetDtoFromJson(Map<String, dynamic> json) {
  return _AssetDto.fromJson(json);
}

/// @nodoc
mixin _$AssetDto {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get fiatPrice => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  double get percentageChange => throw _privateConstructorUsedError;
  double get totalBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetDtoCopyWith<AssetDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDtoCopyWith<$Res> {
  factory $AssetDtoCopyWith(AssetDto value, $Res Function(AssetDto) then) =
      _$AssetDtoCopyWithImpl<$Res, AssetDto>;
  @useResult
  $Res call(
      {String name,
      String symbol,
      String address,
      int quantity,
      double fiatPrice,
      String network,
      int totalCount,
      double percentageChange,
      double totalBalance});
}

/// @nodoc
class _$AssetDtoCopyWithImpl<$Res, $Val extends AssetDto>
    implements $AssetDtoCopyWith<$Res> {
  _$AssetDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? address = null,
    Object? quantity = null,
    Object? fiatPrice = null,
    Object? network = null,
    Object? totalCount = null,
    Object? percentageChange = null,
    Object? totalBalance = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      fiatPrice: null == fiatPrice
          ? _value.fiatPrice
          : fiatPrice // ignore: cast_nullable_to_non_nullable
              as double,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetDtoImplCopyWith<$Res>
    implements $AssetDtoCopyWith<$Res> {
  factory _$$AssetDtoImplCopyWith(
          _$AssetDtoImpl value, $Res Function(_$AssetDtoImpl) then) =
      __$$AssetDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String symbol,
      String address,
      int quantity,
      double fiatPrice,
      String network,
      int totalCount,
      double percentageChange,
      double totalBalance});
}

/// @nodoc
class __$$AssetDtoImplCopyWithImpl<$Res>
    extends _$AssetDtoCopyWithImpl<$Res, _$AssetDtoImpl>
    implements _$$AssetDtoImplCopyWith<$Res> {
  __$$AssetDtoImplCopyWithImpl(
      _$AssetDtoImpl _value, $Res Function(_$AssetDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
    Object? address = null,
    Object? quantity = null,
    Object? fiatPrice = null,
    Object? network = null,
    Object? totalCount = null,
    Object? percentageChange = null,
    Object? totalBalance = null,
  }) {
    return _then(_$AssetDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      fiatPrice: null == fiatPrice
          ? _value.fiatPrice
          : fiatPrice // ignore: cast_nullable_to_non_nullable
              as double,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDtoImpl extends _AssetDto {
  const _$AssetDtoImpl(
      {required this.name,
      required this.symbol,
      required this.address,
      required this.quantity,
      required this.fiatPrice,
      required this.network,
      required this.totalCount,
      required this.percentageChange,
      required this.totalBalance})
      : super._();

  factory _$AssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;
  @override
  final String address;
  @override
  final int quantity;
  @override
  final double fiatPrice;
  @override
  final String network;
  @override
  final int totalCount;
  @override
  final double percentageChange;
  @override
  final double totalBalance;

  @override
  String toString() {
    return 'AssetDto(name: $name, symbol: $symbol, address: $address, quantity: $quantity, fiatPrice: $fiatPrice, network: $network, totalCount: $totalCount, percentageChange: $percentageChange, totalBalance: $totalBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.fiatPrice, fiatPrice) ||
                other.fiatPrice == fiatPrice) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol, address, quantity,
      fiatPrice, network, totalCount, percentageChange, totalBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      __$$AssetDtoImplCopyWithImpl<_$AssetDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDtoImplToJson(
      this,
    );
  }
}

abstract class _AssetDto extends AssetDto {
  const factory _AssetDto(
      {required final String name,
      required final String symbol,
      required final String address,
      required final int quantity,
      required final double fiatPrice,
      required final String network,
      required final int totalCount,
      required final double percentageChange,
      required final double totalBalance}) = _$AssetDtoImpl;
  const _AssetDto._() : super._();

  factory _AssetDto.fromJson(Map<String, dynamic> json) =
      _$AssetDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  String get address;
  @override
  int get quantity;
  @override
  double get fiatPrice;
  @override
  String get network;
  @override
  int get totalCount;
  @override
  double get percentageChange;
  @override
  double get totalBalance;
  @override
  @JsonKey(ignore: true)
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
