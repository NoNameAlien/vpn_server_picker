// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerDto {

 String get id; String get name; String get country; int get latencyMs; bool get isMine; bool get isFavorite; String get countryCode;
/// Create a copy of ServerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerDtoCopyWith<ServerDto> get copyWith => _$ServerDtoCopyWithImpl<ServerDto>(this as ServerDto, _$identity);

  /// Serializes this ServerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.latencyMs, latencyMs) || other.latencyMs == latencyMs)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,latencyMs,isMine,isFavorite,countryCode);

@override
String toString() {
  return 'ServerDto(id: $id, name: $name, country: $country, latencyMs: $latencyMs, isMine: $isMine, isFavorite: $isFavorite, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class $ServerDtoCopyWith<$Res>  {
  factory $ServerDtoCopyWith(ServerDto value, $Res Function(ServerDto) _then) = _$ServerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String country, int latencyMs, bool isMine, bool isFavorite, String countryCode
});




}
/// @nodoc
class _$ServerDtoCopyWithImpl<$Res>
    implements $ServerDtoCopyWith<$Res> {
  _$ServerDtoCopyWithImpl(this._self, this._then);

  final ServerDto _self;
  final $Res Function(ServerDto) _then;

/// Create a copy of ServerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? country = null,Object? latencyMs = null,Object? isMine = null,Object? isFavorite = null,Object? countryCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latencyMs: null == latencyMs ? _self.latencyMs : latencyMs // ignore: cast_nullable_to_non_nullable
as int,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerDto].
extension ServerDtoPatterns on ServerDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerDto value)  $default,){
final _that = this;
switch (_that) {
case _ServerDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerDto value)?  $default,){
final _that = this;
switch (_that) {
case _ServerDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String country,  int latencyMs,  bool isMine,  bool isFavorite,  String countryCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerDto() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.latencyMs,_that.isMine,_that.isFavorite,_that.countryCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String country,  int latencyMs,  bool isMine,  bool isFavorite,  String countryCode)  $default,) {final _that = this;
switch (_that) {
case _ServerDto():
return $default(_that.id,_that.name,_that.country,_that.latencyMs,_that.isMine,_that.isFavorite,_that.countryCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String country,  int latencyMs,  bool isMine,  bool isFavorite,  String countryCode)?  $default,) {final _that = this;
switch (_that) {
case _ServerDto() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.latencyMs,_that.isMine,_that.isFavorite,_that.countryCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerDto extends ServerDto {
  const _ServerDto({required this.id, required this.name, required this.country, required this.latencyMs, required this.isMine, required this.isFavorite, required this.countryCode}): super._();
  factory _ServerDto.fromJson(Map<String, dynamic> json) => _$ServerDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String country;
@override final  int latencyMs;
@override final  bool isMine;
@override final  bool isFavorite;
@override final  String countryCode;

/// Create a copy of ServerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerDtoCopyWith<_ServerDto> get copyWith => __$ServerDtoCopyWithImpl<_ServerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.latencyMs, latencyMs) || other.latencyMs == latencyMs)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,latencyMs,isMine,isFavorite,countryCode);

@override
String toString() {
  return 'ServerDto(id: $id, name: $name, country: $country, latencyMs: $latencyMs, isMine: $isMine, isFavorite: $isFavorite, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class _$ServerDtoCopyWith<$Res> implements $ServerDtoCopyWith<$Res> {
  factory _$ServerDtoCopyWith(_ServerDto value, $Res Function(_ServerDto) _then) = __$ServerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String country, int latencyMs, bool isMine, bool isFavorite, String countryCode
});




}
/// @nodoc
class __$ServerDtoCopyWithImpl<$Res>
    implements _$ServerDtoCopyWith<$Res> {
  __$ServerDtoCopyWithImpl(this._self, this._then);

  final _ServerDto _self;
  final $Res Function(_ServerDto) _then;

/// Create a copy of ServerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? latencyMs = null,Object? isMine = null,Object? isFavorite = null,Object? countryCode = null,}) {
  return _then(_ServerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,latencyMs: null == latencyMs ? _self.latencyMs : latencyMs // ignore: cast_nullable_to_non_nullable
as int,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
