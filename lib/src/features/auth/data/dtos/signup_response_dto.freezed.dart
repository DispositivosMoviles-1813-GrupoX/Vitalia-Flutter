// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpResponseDto {

 int get id; String get username; List<String> get roles;
/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpResponseDtoCopyWith<SignUpResponseDto> get copyWith => _$SignUpResponseDtoCopyWithImpl<SignUpResponseDto>(this as SignUpResponseDto, _$identity);

  /// Serializes this SignUpResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other.roles, roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'SignUpResponseDto(id: $id, username: $username, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $SignUpResponseDtoCopyWith<$Res>  {
  factory $SignUpResponseDtoCopyWith(SignUpResponseDto value, $Res Function(SignUpResponseDto) _then) = _$SignUpResponseDtoCopyWithImpl;
@useResult
$Res call({
 int id, String username, List<String> roles
});




}
/// @nodoc
class _$SignUpResponseDtoCopyWithImpl<$Res>
    implements $SignUpResponseDtoCopyWith<$Res> {
  _$SignUpResponseDtoCopyWithImpl(this._self, this._then);

  final SignUpResponseDto _self;
  final $Res Function(SignUpResponseDto) _then;

/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? roles = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpResponseDto].
extension SignUpResponseDtoPatterns on SignUpResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SignUpResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  List<String> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
return $default(_that.id,_that.username,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  List<String> roles)  $default,) {final _that = this;
switch (_that) {
case _SignUpResponseDto():
return $default(_that.id,_that.username,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  List<String> roles)?  $default,) {final _that = this;
switch (_that) {
case _SignUpResponseDto() when $default != null:
return $default(_that.id,_that.username,_that.roles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpResponseDto implements SignUpResponseDto {
  const _SignUpResponseDto({required this.id, required this.username, required final  List<String> roles}): _roles = roles;
  factory _SignUpResponseDto.fromJson(Map<String, dynamic> json) => _$SignUpResponseDtoFromJson(json);

@override final  int id;
@override final  String username;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpResponseDtoCopyWith<_SignUpResponseDto> get copyWith => __$SignUpResponseDtoCopyWithImpl<_SignUpResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other._roles, _roles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'SignUpResponseDto(id: $id, username: $username, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$SignUpResponseDtoCopyWith<$Res> implements $SignUpResponseDtoCopyWith<$Res> {
  factory _$SignUpResponseDtoCopyWith(_SignUpResponseDto value, $Res Function(_SignUpResponseDto) _then) = __$SignUpResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, List<String> roles
});




}
/// @nodoc
class __$SignUpResponseDtoCopyWithImpl<$Res>
    implements _$SignUpResponseDtoCopyWith<$Res> {
  __$SignUpResponseDtoCopyWithImpl(this._self, this._then);

  final _SignUpResponseDto _self;
  final $Res Function(_SignUpResponseDto) _then;

/// Create a copy of SignUpResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? roles = null,}) {
  return _then(_SignUpResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
