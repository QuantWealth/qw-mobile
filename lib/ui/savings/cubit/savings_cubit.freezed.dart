// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavingsState {
  String get amount => throw _privateConstructorUsedError;
  List<SavingsDto> get savingOptions => throw _privateConstructorUsedError;
  AmountInputLevels? get selectedInputLevel =>
      throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavingsStateCopyWith<SavingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsStateCopyWith<$Res> {
  factory $SavingsStateCopyWith(
          SavingsState value, $Res Function(SavingsState) then) =
      _$SavingsStateCopyWithImpl<$Res, SavingsState>;
  @useResult
  $Res call(
      {String amount,
      List<SavingsDto> savingOptions,
      AmountInputLevels? selectedInputLevel,
      RequestStatus status,
      String? error});
}

/// @nodoc
class _$SavingsStateCopyWithImpl<$Res, $Val extends SavingsState>
    implements $SavingsStateCopyWith<$Res> {
  _$SavingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? savingOptions = null,
    Object? selectedInputLevel = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      savingOptions: null == savingOptions
          ? _value.savingOptions
          : savingOptions // ignore: cast_nullable_to_non_nullable
              as List<SavingsDto>,
      selectedInputLevel: freezed == selectedInputLevel
          ? _value.selectedInputLevel
          : selectedInputLevel // ignore: cast_nullable_to_non_nullable
              as AmountInputLevels?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SavingsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      List<SavingsDto> savingOptions,
      AmountInputLevels? selectedInputLevel,
      RequestStatus status,
      String? error});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SavingsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? savingOptions = null,
    Object? selectedInputLevel = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$InitialImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      savingOptions: null == savingOptions
          ? _value._savingOptions
          : savingOptions // ignore: cast_nullable_to_non_nullable
              as List<SavingsDto>,
      selectedInputLevel: freezed == selectedInputLevel
          ? _value.selectedInputLevel
          : selectedInputLevel // ignore: cast_nullable_to_non_nullable
              as AmountInputLevels?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.amount,
      required final List<SavingsDto> savingOptions,
      required this.selectedInputLevel,
      required this.status,
      this.error})
      : _savingOptions = savingOptions;

  @override
  final String amount;
  final List<SavingsDto> _savingOptions;
  @override
  List<SavingsDto> get savingOptions {
    if (_savingOptions is EqualUnmodifiableListView) return _savingOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savingOptions);
  }

  @override
  final AmountInputLevels? selectedInputLevel;
  @override
  final RequestStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'SavingsState(amount: $amount, savingOptions: $savingOptions, selectedInputLevel: $selectedInputLevel, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._savingOptions, _savingOptions) &&
            (identical(other.selectedInputLevel, selectedInputLevel) ||
                other.selectedInputLevel == selectedInputLevel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      const DeepCollectionEquality().hash(_savingOptions),
      selectedInputLevel,
      status,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements SavingsState {
  const factory _Initial(
      {required final String amount,
      required final List<SavingsDto> savingOptions,
      required final AmountInputLevels? selectedInputLevel,
      required final RequestStatus status,
      final String? error}) = _$InitialImpl;

  @override
  String get amount;
  @override
  List<SavingsDto> get savingOptions;
  @override
  AmountInputLevels? get selectedInputLevel;
  @override
  RequestStatus get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
