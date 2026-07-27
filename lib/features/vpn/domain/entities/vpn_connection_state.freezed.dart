// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vpn_connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VpnConnectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VpnConnectionState()';
}


}

/// @nodoc
class $VpnConnectionStateCopyWith<$Res>  {
$VpnConnectionStateCopyWith(VpnConnectionState _, $Res Function(VpnConnectionState) __);
}


/// Adds pattern-matching-related methods to [VpnConnectionState].
extension VpnConnectionStatePatterns on VpnConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VpnDisconnected value)?  disconnected,TResult Function( VpnConnecting value)?  connecting,TResult Function( VpnConnected value)?  connected,TResult Function( VpnDisconnecting value)?  disconnecting,TResult Function( VpnConnectionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VpnDisconnected() when disconnected != null:
return disconnected(_that);case VpnConnecting() when connecting != null:
return connecting(_that);case VpnConnected() when connected != null:
return connected(_that);case VpnDisconnecting() when disconnecting != null:
return disconnecting(_that);case VpnConnectionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VpnDisconnected value)  disconnected,required TResult Function( VpnConnecting value)  connecting,required TResult Function( VpnConnected value)  connected,required TResult Function( VpnDisconnecting value)  disconnecting,required TResult Function( VpnConnectionFailure value)  failure,}){
final _that = this;
switch (_that) {
case VpnDisconnected():
return disconnected(_that);case VpnConnecting():
return connecting(_that);case VpnConnected():
return connected(_that);case VpnDisconnecting():
return disconnecting(_that);case VpnConnectionFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VpnDisconnected value)?  disconnected,TResult? Function( VpnConnecting value)?  connecting,TResult? Function( VpnConnected value)?  connected,TResult? Function( VpnDisconnecting value)?  disconnecting,TResult? Function( VpnConnectionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case VpnDisconnected() when disconnected != null:
return disconnected(_that);case VpnConnecting() when connecting != null:
return connecting(_that);case VpnConnected() when connected != null:
return connected(_that);case VpnDisconnecting() when disconnecting != null:
return disconnecting(_that);case VpnConnectionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  disconnected,TResult Function( String serverId)?  connecting,TResult Function( String serverId,  DateTime connectedAt)?  connected,TResult Function( String serverId)?  disconnecting,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VpnDisconnected() when disconnected != null:
return disconnected();case VpnConnecting() when connecting != null:
return connecting(_that.serverId);case VpnConnected() when connected != null:
return connected(_that.serverId,_that.connectedAt);case VpnDisconnecting() when disconnecting != null:
return disconnecting(_that.serverId);case VpnConnectionFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  disconnected,required TResult Function( String serverId)  connecting,required TResult Function( String serverId,  DateTime connectedAt)  connected,required TResult Function( String serverId)  disconnecting,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case VpnDisconnected():
return disconnected();case VpnConnecting():
return connecting(_that.serverId);case VpnConnected():
return connected(_that.serverId,_that.connectedAt);case VpnDisconnecting():
return disconnecting(_that.serverId);case VpnConnectionFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  disconnected,TResult? Function( String serverId)?  connecting,TResult? Function( String serverId,  DateTime connectedAt)?  connected,TResult? Function( String serverId)?  disconnecting,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case VpnDisconnected() when disconnected != null:
return disconnected();case VpnConnecting() when connecting != null:
return connecting(_that.serverId);case VpnConnected() when connected != null:
return connected(_that.serverId,_that.connectedAt);case VpnDisconnecting() when disconnecting != null:
return disconnecting(_that.serverId);case VpnConnectionFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class VpnDisconnected implements VpnConnectionState {
  const VpnDisconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnDisconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VpnConnectionState.disconnected()';
}


}




/// @nodoc


class VpnConnecting implements VpnConnectionState {
  const VpnConnecting({required this.serverId});
  

 final  String serverId;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnConnectingCopyWith<VpnConnecting> get copyWith => _$VpnConnectingCopyWithImpl<VpnConnecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnConnecting&&(identical(other.serverId, serverId) || other.serverId == serverId));
}


@override
int get hashCode => Object.hash(runtimeType,serverId);

@override
String toString() {
  return 'VpnConnectionState.connecting(serverId: $serverId)';
}


}

/// @nodoc
abstract mixin class $VpnConnectingCopyWith<$Res> implements $VpnConnectionStateCopyWith<$Res> {
  factory $VpnConnectingCopyWith(VpnConnecting value, $Res Function(VpnConnecting) _then) = _$VpnConnectingCopyWithImpl;
@useResult
$Res call({
 String serverId
});




}
/// @nodoc
class _$VpnConnectingCopyWithImpl<$Res>
    implements $VpnConnectingCopyWith<$Res> {
  _$VpnConnectingCopyWithImpl(this._self, this._then);

  final VpnConnecting _self;
  final $Res Function(VpnConnecting) _then;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serverId = null,}) {
  return _then(VpnConnecting(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VpnConnected implements VpnConnectionState {
  const VpnConnected({required this.serverId, required this.connectedAt});
  

 final  String serverId;
 final  DateTime connectedAt;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnConnectedCopyWith<VpnConnected> get copyWith => _$VpnConnectedCopyWithImpl<VpnConnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnConnected&&(identical(other.serverId, serverId) || other.serverId == serverId)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt));
}


@override
int get hashCode => Object.hash(runtimeType,serverId,connectedAt);

@override
String toString() {
  return 'VpnConnectionState.connected(serverId: $serverId, connectedAt: $connectedAt)';
}


}

/// @nodoc
abstract mixin class $VpnConnectedCopyWith<$Res> implements $VpnConnectionStateCopyWith<$Res> {
  factory $VpnConnectedCopyWith(VpnConnected value, $Res Function(VpnConnected) _then) = _$VpnConnectedCopyWithImpl;
@useResult
$Res call({
 String serverId, DateTime connectedAt
});




}
/// @nodoc
class _$VpnConnectedCopyWithImpl<$Res>
    implements $VpnConnectedCopyWith<$Res> {
  _$VpnConnectedCopyWithImpl(this._self, this._then);

  final VpnConnected _self;
  final $Res Function(VpnConnected) _then;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serverId = null,Object? connectedAt = null,}) {
  return _then(VpnConnected(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,connectedAt: null == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class VpnDisconnecting implements VpnConnectionState {
  const VpnDisconnecting({required this.serverId});
  

 final  String serverId;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnDisconnectingCopyWith<VpnDisconnecting> get copyWith => _$VpnDisconnectingCopyWithImpl<VpnDisconnecting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnDisconnecting&&(identical(other.serverId, serverId) || other.serverId == serverId));
}


@override
int get hashCode => Object.hash(runtimeType,serverId);

@override
String toString() {
  return 'VpnConnectionState.disconnecting(serverId: $serverId)';
}


}

/// @nodoc
abstract mixin class $VpnDisconnectingCopyWith<$Res> implements $VpnConnectionStateCopyWith<$Res> {
  factory $VpnDisconnectingCopyWith(VpnDisconnecting value, $Res Function(VpnDisconnecting) _then) = _$VpnDisconnectingCopyWithImpl;
@useResult
$Res call({
 String serverId
});




}
/// @nodoc
class _$VpnDisconnectingCopyWithImpl<$Res>
    implements $VpnDisconnectingCopyWith<$Res> {
  _$VpnDisconnectingCopyWithImpl(this._self, this._then);

  final VpnDisconnecting _self;
  final $Res Function(VpnDisconnecting) _then;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serverId = null,}) {
  return _then(VpnDisconnecting(
serverId: null == serverId ? _self.serverId : serverId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VpnConnectionFailure implements VpnConnectionState {
  const VpnConnectionFailure({required this.message});
  

 final  String message;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VpnConnectionFailureCopyWith<VpnConnectionFailure> get copyWith => _$VpnConnectionFailureCopyWithImpl<VpnConnectionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VpnConnectionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VpnConnectionState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $VpnConnectionFailureCopyWith<$Res> implements $VpnConnectionStateCopyWith<$Res> {
  factory $VpnConnectionFailureCopyWith(VpnConnectionFailure value, $Res Function(VpnConnectionFailure) _then) = _$VpnConnectionFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$VpnConnectionFailureCopyWithImpl<$Res>
    implements $VpnConnectionFailureCopyWith<$Res> {
  _$VpnConnectionFailureCopyWithImpl(this._self, this._then);

  final VpnConnectionFailure _self;
  final $Res Function(VpnConnectionFailure) _then;

/// Create a copy of VpnConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(VpnConnectionFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
