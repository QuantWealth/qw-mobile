// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tx_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TxState {
  TxStatus get status => throw _privateConstructorUsedError;
  ApprovedTxDto? get tx => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TxStateCopyWith<TxState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxStateCopyWith<$Res> {
  factory $TxStateCopyWith(TxState value, $Res Function(TxState) then) =
      _$TxStateCopyWithImpl<$Res, TxState>;
  @useResult
  $Res call({TxStatus status, ApprovedTxDto? tx, int? amount, String? error});

  $ApprovedTxDtoCopyWith<$Res>? get tx;
}

/// @nodoc
class _$TxStateCopyWithImpl<$Res, $Val extends TxState>
    implements $TxStateCopyWith<$Res> {
  _$TxStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tx = freezed,
    Object? amount = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TxStatus,
      tx: freezed == tx
          ? _value.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as ApprovedTxDto?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovedTxDtoCopyWith<$Res>? get tx {
    if (_value.tx == null) {
      return null;
    }

    return $ApprovedTxDtoCopyWith<$Res>(_value.tx!, (value) {
      return _then(_value.copyWith(tx: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $TxStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TxStatus status, ApprovedTxDto? tx, int? amount, String? error});

  @override
  $ApprovedTxDtoCopyWith<$Res>? get tx;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TxStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tx = freezed,
    Object? amount = freezed,
    Object? error = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TxStatus,
      tx: freezed == tx
          ? _value.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as ApprovedTxDto?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.status, this.tx, this.amount, this.error});

  @override
  final TxStatus status;
  @override
  final ApprovedTxDto? tx;
  @override
  final int? amount;
  @override
  final String? error;

  @override
  String toString() {
    return 'TxState(status: $status, tx: $tx, amount: $amount, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tx, tx) || other.tx == tx) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, tx, amount, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TxState {
  const factory _Initial(
      {required final TxStatus status,
      final ApprovedTxDto? tx,
      final int? amount,
      final String? error}) = _$InitialImpl;

  @override
  TxStatus get status;
  @override
  ApprovedTxDto? get tx;
  @override
  int? get amount;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
