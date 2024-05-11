// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavingsDto _$SavingsDtoFromJson(Map<String, dynamic> json) {
  return _SavingsDto.fromJson(json);
}

/// @nodoc
mixin _$SavingsDto {
  double get investedAmount => throw _privateConstructorUsedError;
  double get apy => throw _privateConstructorUsedError;
  double get currentAmount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get strategy => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<dynamic> get graph => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavingsDtoCopyWith<SavingsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsDtoCopyWith<$Res> {
  factory $SavingsDtoCopyWith(
          SavingsDto value, $Res Function(SavingsDto) then) =
      _$SavingsDtoCopyWithImpl<$Res, SavingsDto>;
  @useResult
  $Res call(
      {double investedAmount,
      double apy,
      double currentAmount,
      String type,
      int strategy,
      String description,
      List<dynamic> graph,
      String identifier});
}

/// @nodoc
class _$SavingsDtoCopyWithImpl<$Res, $Val extends SavingsDto>
    implements $SavingsDtoCopyWith<$Res> {
  _$SavingsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investedAmount = null,
    Object? apy = null,
    Object? currentAmount = null,
    Object? type = null,
    Object? strategy = null,
    Object? description = null,
    Object? graph = null,
    Object? identifier = null,
  }) {
    return _then(_value.copyWith(
      investedAmount: null == investedAmount
          ? _value.investedAmount
          : investedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as double,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      graph: null == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingsDtoImplCopyWith<$Res>
    implements $SavingsDtoCopyWith<$Res> {
  factory _$$SavingsDtoImplCopyWith(
          _$SavingsDtoImpl value, $Res Function(_$SavingsDtoImpl) then) =
      __$$SavingsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double investedAmount,
      double apy,
      double currentAmount,
      String type,
      int strategy,
      String description,
      List<dynamic> graph,
      String identifier});
}

/// @nodoc
class __$$SavingsDtoImplCopyWithImpl<$Res>
    extends _$SavingsDtoCopyWithImpl<$Res, _$SavingsDtoImpl>
    implements _$$SavingsDtoImplCopyWith<$Res> {
  __$$SavingsDtoImplCopyWithImpl(
      _$SavingsDtoImpl _value, $Res Function(_$SavingsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investedAmount = null,
    Object? apy = null,
    Object? currentAmount = null,
    Object? type = null,
    Object? strategy = null,
    Object? description = null,
    Object? graph = null,
    Object? identifier = null,
  }) {
    return _then(_$SavingsDtoImpl(
      investedAmount: null == investedAmount
          ? _value.investedAmount
          : investedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      apy: null == apy
          ? _value.apy
          : apy // ignore: cast_nullable_to_non_nullable
              as double,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      graph: null == graph
          ? _value._graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavingsDtoImpl extends _SavingsDto {
  const _$SavingsDtoImpl(
      {required this.investedAmount,
      required this.apy,
      required this.currentAmount,
      required this.type,
      required this.strategy,
      required this.description,
      required final List<dynamic> graph,
      required this.identifier})
      : _graph = graph,
        super._();

  factory _$SavingsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavingsDtoImplFromJson(json);

  @override
  final double investedAmount;
  @override
  final double apy;
  @override
  final double currentAmount;
  @override
  final String type;
  @override
  final int strategy;
  @override
  final String description;
  final List<dynamic> _graph;
  @override
  List<dynamic> get graph {
    if (_graph is EqualUnmodifiableListView) return _graph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_graph);
  }

  @override
  final String identifier;

  @override
  String toString() {
    return 'SavingsDto(investedAmount: $investedAmount, apy: $apy, currentAmount: $currentAmount, type: $type, strategy: $strategy, description: $description, graph: $graph, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsDtoImpl &&
            (identical(other.investedAmount, investedAmount) ||
                other.investedAmount == investedAmount) &&
            (identical(other.apy, apy) || other.apy == apy) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._graph, _graph) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      investedAmount,
      apy,
      currentAmount,
      type,
      strategy,
      description,
      const DeepCollectionEquality().hash(_graph),
      identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsDtoImplCopyWith<_$SavingsDtoImpl> get copyWith =>
      __$$SavingsDtoImplCopyWithImpl<_$SavingsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavingsDtoImplToJson(
      this,
    );
  }
}

abstract class _SavingsDto extends SavingsDto {
  const factory _SavingsDto(
      {required final double investedAmount,
      required final double apy,
      required final double currentAmount,
      required final String type,
      required final int strategy,
      required final String description,
      required final List<dynamic> graph,
      required final String identifier}) = _$SavingsDtoImpl;
  const _SavingsDto._() : super._();

  factory _SavingsDto.fromJson(Map<String, dynamic> json) =
      _$SavingsDtoImpl.fromJson;

  @override
  double get investedAmount;
  @override
  double get apy;
  @override
  double get currentAmount;
  @override
  String get type;
  @override
  int get strategy;
  @override
  String get description;
  @override
  List<dynamic> get graph;
  @override
  String get identifier;
  @override
  @JsonKey(ignore: true)
  _$$SavingsDtoImplCopyWith<_$SavingsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
