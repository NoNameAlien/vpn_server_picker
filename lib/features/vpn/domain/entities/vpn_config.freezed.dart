// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vpn_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VpnConfig {

 String get id; String get userId; String get deviceId; String get serverId; VpnProtocol get protocol; String get endpoint; DateTime get issuedAt; DateTime? get expiresAt;
/// Create a copy of VpnConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnConfigCopyWith<VpnConfig> get copyWith => _$VpnConfigCopyWithImpl<VpnConfig>(this as VpnConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,serverId,protocol,endpoint,issuedAt,expiresAt);

@override
String toString() {
  return 'VpnConfig(id: $id, userId: $userId, deviceId: $deviceId, serverId: $serverId, protocol: $protocol, endpoint: $endpoint, issuedAt: $issuedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $VpnConfigCopyWith<$Res>  {
  factory $VpnConfigCopyWith(VpnConfig value, $Res Function(VpnConfig) _then) = _$VpnConfigCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String deviceId, String serverId, VpnProtocol protocol, String endpoint, DateTime issuedAt, DateTime? expiresAt
});




}
/// @nodoc
class _$VpnConfigCopyWithImpl<$Res>
    implements $VpnConfigCopyWith<$Res> {
  _$VpnConfigCopyWithImpl(this._self, this._then);

  final VpnConfig _self;
  final $Res Function(VpnConfig) _then;

/// Create a copy of VpnConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? serverId = null,Object? protocol = null,Object? endpoint = null,Object? issuedAt = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as VpnProtocol,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VpnConfig].
extension VpnConfigPatterns on VpnConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VpnConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VpnConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VpnConfig value)  $default,){
final _that = this;
switch (_that) {
case _VpnConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VpnConfig value)?  $default,){
final _that = this;
switch (_that) {
case _VpnConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  String serverId,  VpnProtocol protocol,  String endpoint,  DateTime issuedAt,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VpnConfig() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.serverId,_that.protocol,_that.endpoint,_that.issuedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String deviceId,  String serverId,  VpnProtocol protocol,  String endpoint,  DateTime issuedAt,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _VpnConfig():
return $default(_that.id,_that.userId,_that.deviceId,_that.serverId,_that.protocol,_that.endpoint,_that.issuedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String deviceId,  String serverId,  VpnProtocol protocol,  String endpoint,  DateTime issuedAt,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _VpnConfig() when $default != null:
return $default(_that.id,_that.userId,_that.deviceId,_that.serverId,_that.protocol,_that.endpoint,_that.issuedAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _VpnConfig implements VpnConfig {
  const _VpnConfig({required this.id, required this.userId, required this.deviceId, required this.serverId, required this.protocol, required this.endpoint, required this.issuedAt, this.expiresAt});
  

@override final  String id;
@override final  String userId;
@override final  String deviceId;
@override final  String serverId;
@override final  VpnProtocol protocol;
@override final  String endpoint;
@override final  DateTime issuedAt;
@override final  DateTime? expiresAt;

/// Create a copy of VpnConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VpnConfigCopyWith<_VpnConfig> get copyWith => __$VpnConfigCopyWithImpl<_VpnConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VpnConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.protocol, protocol) || other.protocol == protocol)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,deviceId,serverId,protocol,endpoint,issuedAt,expiresAt);

@override
String toString() {
  return 'VpnConfig(id: $id, userId: $userId, deviceId: $deviceId, serverId: $serverId, protocol: $protocol, endpoint: $endpoint, issuedAt: $issuedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$VpnConfigCopyWith<$Res> implements $VpnConfigCopyWith<$Res> {
  factory _$VpnConfigCopyWith(_VpnConfig value, $Res Function(_VpnConfig) _then) = __$VpnConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String deviceId, String serverId, VpnProtocol protocol, String endpoint, DateTime issuedAt, DateTime? expiresAt
});




}
/// @nodoc
class __$VpnConfigCopyWithImpl<$Res>
    implements _$VpnConfigCopyWith<$Res> {
  __$VpnConfigCopyWithImpl(this._self, this._then);

  final _VpnConfig _self;
  final $Res Function(_VpnConfig) _then;

/// Create a copy of VpnConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? deviceId = null,Object? serverId = null,Object? protocol = null,Object? endpoint = null,Object? issuedAt = null,Object? expiresAt = freezed,}) {
  return _then(_VpnConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,protocol: null == protocol ? _self.protocol : protocol // ignore: cast_nullable_to_non_nullable
as VpnProtocol,endpoint: null == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
