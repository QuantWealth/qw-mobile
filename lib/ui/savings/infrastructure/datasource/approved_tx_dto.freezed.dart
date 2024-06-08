// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approved_tx_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApprovedTxDto _$ApprovedTxDtoFromJson(Map<String, dynamic> json) {
  return _ApprovedTxDto.fromJson(json);
}

/// @nodoc
mixin _$ApprovedTxDto {
  String get typedData => throw _privateConstructorUsedError;
  MetaTxData get txData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovedTxDtoCopyWith<ApprovedTxDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovedTxDtoCopyWith<$Res> {
  factory $ApprovedTxDtoCopyWith(
          ApprovedTxDto value, $Res Function(ApprovedTxDto) then) =
      _$ApprovedTxDtoCopyWithImpl<$Res, ApprovedTxDto>;
  @useResult
  $Res call({String typedData, MetaTxData txData});

  $MetaTxDataCopyWith<$Res> get txData;
}

/// @nodoc
class _$ApprovedTxDtoCopyWithImpl<$Res, $Val extends ApprovedTxDto>
    implements $ApprovedTxDtoCopyWith<$Res> {
  _$ApprovedTxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typedData = null,
    Object? txData = null,
  }) {
    return _then(_value.copyWith(
      typedData: null == typedData
          ? _value.typedData
          : typedData // ignore: cast_nullable_to_non_nullable
              as String,
      txData: null == txData
          ? _value.txData
          : txData // ignore: cast_nullable_to_non_nullable
              as MetaTxData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaTxDataCopyWith<$Res> get txData {
    return $MetaTxDataCopyWith<$Res>(_value.txData, (value) {
      return _then(_value.copyWith(txData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApprovedTxDtoImplCopyWith<$Res>
    implements $ApprovedTxDtoCopyWith<$Res> {
  factory _$$ApprovedTxDtoImplCopyWith(
          _$ApprovedTxDtoImpl value, $Res Function(_$ApprovedTxDtoImpl) then) =
      __$$ApprovedTxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String typedData, MetaTxData txData});

  @override
  $MetaTxDataCopyWith<$Res> get txData;
}

/// @nodoc
class __$$ApprovedTxDtoImplCopyWithImpl<$Res>
    extends _$ApprovedTxDtoCopyWithImpl<$Res, _$ApprovedTxDtoImpl>
    implements _$$ApprovedTxDtoImplCopyWith<$Res> {
  __$$ApprovedTxDtoImplCopyWithImpl(
      _$ApprovedTxDtoImpl _value, $Res Function(_$ApprovedTxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typedData = null,
    Object? txData = null,
  }) {
    return _then(_$ApprovedTxDtoImpl(
      typedData: null == typedData
          ? _value.typedData
          : typedData // ignore: cast_nullable_to_non_nullable
              as String,
      txData: null == txData
          ? _value.txData
          : txData // ignore: cast_nullable_to_non_nullable
              as MetaTxData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovedTxDtoImpl extends _ApprovedTxDto {
  const _$ApprovedTxDtoImpl({required this.typedData, required this.txData})
      : super._();

  factory _$ApprovedTxDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovedTxDtoImplFromJson(json);

  @override
  final String typedData;
  @override
  final MetaTxData txData;

  @override
  String toString() {
    return 'ApprovedTxDto(typedData: $typedData, txData: $txData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovedTxDtoImpl &&
            (identical(other.typedData, typedData) ||
                other.typedData == typedData) &&
            (identical(other.txData, txData) || other.txData == txData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, typedData, txData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovedTxDtoImplCopyWith<_$ApprovedTxDtoImpl> get copyWith =>
      __$$ApprovedTxDtoImplCopyWithImpl<_$ApprovedTxDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovedTxDtoImplToJson(
      this,
    );
  }
}

abstract class _ApprovedTxDto extends ApprovedTxDto {
  const factory _ApprovedTxDto(
      {required final String typedData,
      required final MetaTxData txData}) = _$ApprovedTxDtoImpl;
  const _ApprovedTxDto._() : super._();

  factory _ApprovedTxDto.fromJson(Map<String, dynamic> json) =
      _$ApprovedTxDtoImpl.fromJson;

  @override
  String get typedData;
  @override
  MetaTxData get txData;
  @override
  @JsonKey(ignore: true)
  _$$ApprovedTxDtoImplCopyWith<_$ApprovedTxDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaTxData _$MetaTxDataFromJson(Map<String, dynamic> json) {
  return _MetaTxData.fromJson(json);
}

/// @nodoc
mixin _$MetaTxData {
  String get to => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaTxDataCopyWith<MetaTxData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaTxDataCopyWith<$Res> {
  factory $MetaTxDataCopyWith(
          MetaTxData value, $Res Function(MetaTxData) then) =
      _$MetaTxDataCopyWithImpl<$Res, MetaTxData>;
  @useResult
  $Res call({String to, String data, String value});
}

/// @nodoc
class _$MetaTxDataCopyWithImpl<$Res, $Val extends MetaTxData>
    implements $MetaTxDataCopyWith<$Res> {
  _$MetaTxDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? data = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaTxDataImplCopyWith<$Res>
    implements $MetaTxDataCopyWith<$Res> {
  factory _$$MetaTxDataImplCopyWith(
          _$MetaTxDataImpl value, $Res Function(_$MetaTxDataImpl) then) =
      __$$MetaTxDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String to, String data, String value});
}

/// @nodoc
class __$$MetaTxDataImplCopyWithImpl<$Res>
    extends _$MetaTxDataCopyWithImpl<$Res, _$MetaTxDataImpl>
    implements _$$MetaTxDataImplCopyWith<$Res> {
  __$$MetaTxDataImplCopyWithImpl(
      _$MetaTxDataImpl _value, $Res Function(_$MetaTxDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? to = null,
    Object? data = null,
    Object? value = null,
  }) {
    return _then(_$MetaTxDataImpl(
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaTxDataImpl extends _MetaTxData {
  const _$MetaTxDataImpl(
      {required this.to, required this.data, required this.value})
      : super._();

  factory _$MetaTxDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaTxDataImplFromJson(json);

  @override
  final String to;
  @override
  final String data;
  @override
  final String value;

  @override
  String toString() {
    return 'MetaTxData(to: $to, data: $data, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaTxDataImpl &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, to, data, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaTxDataImplCopyWith<_$MetaTxDataImpl> get copyWith =>
      __$$MetaTxDataImplCopyWithImpl<_$MetaTxDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaTxDataImplToJson(
      this,
    );
  }
}

abstract class _MetaTxData extends MetaTxData {
  const factory _MetaTxData(
      {required final String to,
      required final String data,
      required final String value}) = _$MetaTxDataImpl;
  const _MetaTxData._() : super._();

  factory _MetaTxData.fromJson(Map<String, dynamic> json) =
      _$MetaTxDataImpl.fromJson;

  @override
  String get to;
  @override
  String get data;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$MetaTxDataImplCopyWith<_$MetaTxDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
