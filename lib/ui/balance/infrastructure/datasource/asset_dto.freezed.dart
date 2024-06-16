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
  @JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_decimals', defaultValue: 18)
  int get decimals => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract_address')
  String get address => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_urls')
  LogoUrls get logoUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote_rate', defaultValue: .0)
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote_rate_24h', defaultValue: .0)
  double get rate24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote', defaultValue: .0)
  double get quote => throw _privateConstructorUsedError;
  @JsonKey(name: 'quote_24h', defaultValue: .0)
  double get quote24h => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'contract_name', defaultValue: 'Unnamed') String name,
      @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
      String symbol,
      @JsonKey(name: 'contract_decimals', defaultValue: 18) int decimals,
      @JsonKey(name: 'contract_address') String address,
      String balance,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'logo_urls') LogoUrls logoUrls,
      @JsonKey(name: 'quote_rate', defaultValue: .0) double rate,
      @JsonKey(name: 'quote_rate_24h', defaultValue: .0) double rate24h,
      @JsonKey(name: 'quote', defaultValue: .0) double quote,
      @JsonKey(name: 'quote_24h', defaultValue: .0) double quote24h});

  $LogoUrlsCopyWith<$Res> get logoUrls;
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
    Object? decimals = null,
    Object? address = null,
    Object? balance = null,
    Object? logoUrl = null,
    Object? logoUrls = null,
    Object? rate = null,
    Object? rate24h = null,
    Object? quote = null,
    Object? quote24h = null,
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
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrls: null == logoUrls
          ? _value.logoUrls
          : logoUrls // ignore: cast_nullable_to_non_nullable
              as LogoUrls,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      rate24h: null == rate24h
          ? _value.rate24h
          : rate24h // ignore: cast_nullable_to_non_nullable
              as double,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as double,
      quote24h: null == quote24h
          ? _value.quote24h
          : quote24h // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LogoUrlsCopyWith<$Res> get logoUrls {
    return $LogoUrlsCopyWith<$Res>(_value.logoUrls, (value) {
      return _then(_value.copyWith(logoUrls: value) as $Val);
    });
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
      {@JsonKey(name: 'contract_name', defaultValue: 'Unnamed') String name,
      @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
      String symbol,
      @JsonKey(name: 'contract_decimals', defaultValue: 18) int decimals,
      @JsonKey(name: 'contract_address') String address,
      String balance,
      @JsonKey(name: 'logo_url') String logoUrl,
      @JsonKey(name: 'logo_urls') LogoUrls logoUrls,
      @JsonKey(name: 'quote_rate', defaultValue: .0) double rate,
      @JsonKey(name: 'quote_rate_24h', defaultValue: .0) double rate24h,
      @JsonKey(name: 'quote', defaultValue: .0) double quote,
      @JsonKey(name: 'quote_24h', defaultValue: .0) double quote24h});

  @override
  $LogoUrlsCopyWith<$Res> get logoUrls;
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
    Object? decimals = null,
    Object? address = null,
    Object? balance = null,
    Object? logoUrl = null,
    Object? logoUrls = null,
    Object? rate = null,
    Object? rate24h = null,
    Object? quote = null,
    Object? quote24h = null,
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
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrls: null == logoUrls
          ? _value.logoUrls
          : logoUrls // ignore: cast_nullable_to_non_nullable
              as LogoUrls,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      rate24h: null == rate24h
          ? _value.rate24h
          : rate24h // ignore: cast_nullable_to_non_nullable
              as double,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as double,
      quote24h: null == quote24h
          ? _value.quote24h
          : quote24h // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDtoImpl extends _AssetDto {
  const _$AssetDtoImpl(
      {@JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
      required this.name,
      @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
      required this.symbol,
      @JsonKey(name: 'contract_decimals', defaultValue: 18)
      required this.decimals,
      @JsonKey(name: 'contract_address') required this.address,
      required this.balance,
      @JsonKey(name: 'logo_url') required this.logoUrl,
      @JsonKey(name: 'logo_urls') required this.logoUrls,
      @JsonKey(name: 'quote_rate', defaultValue: .0) required this.rate,
      @JsonKey(name: 'quote_rate_24h', defaultValue: .0) required this.rate24h,
      @JsonKey(name: 'quote', defaultValue: .0) required this.quote,
      @JsonKey(name: 'quote_24h', defaultValue: .0) required this.quote24h})
      : super._();

  factory _$AssetDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDtoImplFromJson(json);

  @override
  @JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
  final String name;
  @override
  @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
  final String symbol;
  @override
  @JsonKey(name: 'contract_decimals', defaultValue: 18)
  final int decimals;
  @override
  @JsonKey(name: 'contract_address')
  final String address;
  @override
  final String balance;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  @JsonKey(name: 'logo_urls')
  final LogoUrls logoUrls;
  @override
  @JsonKey(name: 'quote_rate', defaultValue: .0)
  final double rate;
  @override
  @JsonKey(name: 'quote_rate_24h', defaultValue: .0)
  final double rate24h;
  @override
  @JsonKey(name: 'quote', defaultValue: .0)
  final double quote;
  @override
  @JsonKey(name: 'quote_24h', defaultValue: .0)
  final double quote24h;

  @override
  String toString() {
    return 'AssetDto(name: $name, symbol: $symbol, decimals: $decimals, address: $address, balance: $balance, logoUrl: $logoUrl, logoUrls: $logoUrls, rate: $rate, rate24h: $rate24h, quote: $quote, quote24h: $quote24h)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.logoUrls, logoUrls) ||
                other.logoUrls == logoUrls) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.rate24h, rate24h) || other.rate24h == rate24h) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.quote24h, quote24h) ||
                other.quote24h == quote24h));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol, decimals, address,
      balance, logoUrl, logoUrls, rate, rate24h, quote, quote24h);

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
      {@JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
      required final String name,
      @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
      required final String symbol,
      @JsonKey(name: 'contract_decimals', defaultValue: 18)
      required final int decimals,
      @JsonKey(name: 'contract_address') required final String address,
      required final String balance,
      @JsonKey(name: 'logo_url') required final String logoUrl,
      @JsonKey(name: 'logo_urls') required final LogoUrls logoUrls,
      @JsonKey(name: 'quote_rate', defaultValue: .0) required final double rate,
      @JsonKey(name: 'quote_rate_24h', defaultValue: .0)
      required final double rate24h,
      @JsonKey(name: 'quote', defaultValue: .0) required final double quote,
      @JsonKey(name: 'quote_24h', defaultValue: .0)
      required final double quote24h}) = _$AssetDtoImpl;
  const _AssetDto._() : super._();

  factory _AssetDto.fromJson(Map<String, dynamic> json) =
      _$AssetDtoImpl.fromJson;

  @override
  @JsonKey(name: 'contract_name', defaultValue: 'Unnamed')
  String get name;
  @override
  @JsonKey(name: 'contract_ticker_symbol', defaultValue: 'N/A')
  String get symbol;
  @override
  @JsonKey(name: 'contract_decimals', defaultValue: 18)
  int get decimals;
  @override
  @JsonKey(name: 'contract_address')
  String get address;
  @override
  String get balance;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  @override
  @JsonKey(name: 'logo_urls')
  LogoUrls get logoUrls;
  @override
  @JsonKey(name: 'quote_rate', defaultValue: .0)
  double get rate;
  @override
  @JsonKey(name: 'quote_rate_24h', defaultValue: .0)
  double get rate24h;
  @override
  @JsonKey(name: 'quote', defaultValue: .0)
  double get quote;
  @override
  @JsonKey(name: 'quote_24h', defaultValue: .0)
  double get quote24h;
  @override
  @JsonKey(ignore: true)
  _$$AssetDtoImplCopyWith<_$AssetDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogoUrls _$LogoUrlsFromJson(Map<String, dynamic> json) {
  return _LogoUrls.fromJson(json);
}

/// @nodoc
mixin _$LogoUrls {
  @JsonKey(name: 'token_logo_url')
  String get tokenLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'chain_logo_url')
  String get chainLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogoUrlsCopyWith<LogoUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoUrlsCopyWith<$Res> {
  factory $LogoUrlsCopyWith(LogoUrls value, $Res Function(LogoUrls) then) =
      _$LogoUrlsCopyWithImpl<$Res, LogoUrls>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token_logo_url') String tokenLogo,
      @JsonKey(name: 'chain_logo_url') String chainLogo});
}

/// @nodoc
class _$LogoUrlsCopyWithImpl<$Res, $Val extends LogoUrls>
    implements $LogoUrlsCopyWith<$Res> {
  _$LogoUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenLogo = null,
    Object? chainLogo = null,
  }) {
    return _then(_value.copyWith(
      tokenLogo: null == tokenLogo
          ? _value.tokenLogo
          : tokenLogo // ignore: cast_nullable_to_non_nullable
              as String,
      chainLogo: null == chainLogo
          ? _value.chainLogo
          : chainLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogoUrlsImplCopyWith<$Res>
    implements $LogoUrlsCopyWith<$Res> {
  factory _$$LogoUrlsImplCopyWith(
          _$LogoUrlsImpl value, $Res Function(_$LogoUrlsImpl) then) =
      __$$LogoUrlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token_logo_url') String tokenLogo,
      @JsonKey(name: 'chain_logo_url') String chainLogo});
}

/// @nodoc
class __$$LogoUrlsImplCopyWithImpl<$Res>
    extends _$LogoUrlsCopyWithImpl<$Res, _$LogoUrlsImpl>
    implements _$$LogoUrlsImplCopyWith<$Res> {
  __$$LogoUrlsImplCopyWithImpl(
      _$LogoUrlsImpl _value, $Res Function(_$LogoUrlsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenLogo = null,
    Object? chainLogo = null,
  }) {
    return _then(_$LogoUrlsImpl(
      tokenLogo: null == tokenLogo
          ? _value.tokenLogo
          : tokenLogo // ignore: cast_nullable_to_non_nullable
              as String,
      chainLogo: null == chainLogo
          ? _value.chainLogo
          : chainLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogoUrlsImpl extends _LogoUrls {
  const _$LogoUrlsImpl(
      {@JsonKey(name: 'token_logo_url') required this.tokenLogo,
      @JsonKey(name: 'chain_logo_url') required this.chainLogo})
      : super._();

  factory _$LogoUrlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogoUrlsImplFromJson(json);

  @override
  @JsonKey(name: 'token_logo_url')
  final String tokenLogo;
  @override
  @JsonKey(name: 'chain_logo_url')
  final String chainLogo;

  @override
  String toString() {
    return 'LogoUrls(tokenLogo: $tokenLogo, chainLogo: $chainLogo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoUrlsImpl &&
            (identical(other.tokenLogo, tokenLogo) ||
                other.tokenLogo == tokenLogo) &&
            (identical(other.chainLogo, chainLogo) ||
                other.chainLogo == chainLogo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tokenLogo, chainLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoUrlsImplCopyWith<_$LogoUrlsImpl> get copyWith =>
      __$$LogoUrlsImplCopyWithImpl<_$LogoUrlsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogoUrlsImplToJson(
      this,
    );
  }
}

abstract class _LogoUrls extends LogoUrls {
  const factory _LogoUrls(
          {@JsonKey(name: 'token_logo_url') required final String tokenLogo,
          @JsonKey(name: 'chain_logo_url') required final String chainLogo}) =
      _$LogoUrlsImpl;
  const _LogoUrls._() : super._();

  factory _LogoUrls.fromJson(Map<String, dynamic> json) =
      _$LogoUrlsImpl.fromJson;

  @override
  @JsonKey(name: 'token_logo_url')
  String get tokenLogo;
  @override
  @JsonKey(name: 'chain_logo_url')
  String get chainLogo;
  @override
  @JsonKey(ignore: true)
  _$$LogoUrlsImplCopyWith<_$LogoUrlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
