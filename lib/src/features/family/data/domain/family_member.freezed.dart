// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FamilyMember {

 int get id; String get relationship; int get linkedResidentId;// Mapeamos el objeto anidado "fullName"
 FamilyNameDto get fullName;// El backend devuelve "userId": { "value": 9 }, extraemos el valor
@JsonKey(fromJson: _userIdFromJson) int get userId; String? get contactInfo;
/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyMemberCopyWith<FamilyMember> get copyWith => _$FamilyMemberCopyWithImpl<FamilyMember>(this as FamilyMember, _$identity);

  /// Serializes this FamilyMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyMember&&(identical(other.id, id) || other.id == id)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.linkedResidentId, linkedResidentId) || other.linkedResidentId == linkedResidentId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,relationship,linkedResidentId,fullName,userId,contactInfo);

@override
String toString() {
  return 'FamilyMember(id: $id, relationship: $relationship, linkedResidentId: $linkedResidentId, fullName: $fullName, userId: $userId, contactInfo: $contactInfo)';
}


}

/// @nodoc
abstract mixin class $FamilyMemberCopyWith<$Res>  {
  factory $FamilyMemberCopyWith(FamilyMember value, $Res Function(FamilyMember) _then) = _$FamilyMemberCopyWithImpl;
@useResult
$Res call({
 int id, String relationship, int linkedResidentId, FamilyNameDto fullName,@JsonKey(fromJson: _userIdFromJson) int userId, String? contactInfo
});


$FamilyNameDtoCopyWith<$Res> get fullName;

}
/// @nodoc
class _$FamilyMemberCopyWithImpl<$Res>
    implements $FamilyMemberCopyWith<$Res> {
  _$FamilyMemberCopyWithImpl(this._self, this._then);

  final FamilyMember _self;
  final $Res Function(FamilyMember) _then;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? relationship = null,Object? linkedResidentId = null,Object? fullName = null,Object? userId = null,Object? contactInfo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,linkedResidentId: null == linkedResidentId ? _self.linkedResidentId : linkedResidentId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as FamilyNameDto,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyNameDtoCopyWith<$Res> get fullName {
  
  return $FamilyNameDtoCopyWith<$Res>(_self.fullName, (value) {
    return _then(_self.copyWith(fullName: value));
  });
}
}


/// Adds pattern-matching-related methods to [FamilyMember].
extension FamilyMemberPatterns on FamilyMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyMember value)  $default,){
final _that = this;
switch (_that) {
case _FamilyMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyMember value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String relationship,  int linkedResidentId,  FamilyNameDto fullName, @JsonKey(fromJson: _userIdFromJson)  int userId,  String? contactInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that.id,_that.relationship,_that.linkedResidentId,_that.fullName,_that.userId,_that.contactInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String relationship,  int linkedResidentId,  FamilyNameDto fullName, @JsonKey(fromJson: _userIdFromJson)  int userId,  String? contactInfo)  $default,) {final _that = this;
switch (_that) {
case _FamilyMember():
return $default(_that.id,_that.relationship,_that.linkedResidentId,_that.fullName,_that.userId,_that.contactInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String relationship,  int linkedResidentId,  FamilyNameDto fullName, @JsonKey(fromJson: _userIdFromJson)  int userId,  String? contactInfo)?  $default,) {final _that = this;
switch (_that) {
case _FamilyMember() when $default != null:
return $default(_that.id,_that.relationship,_that.linkedResidentId,_that.fullName,_that.userId,_that.contactInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyMember extends FamilyMember {
  const _FamilyMember({required this.id, required this.relationship, required this.linkedResidentId, required this.fullName, @JsonKey(fromJson: _userIdFromJson) required this.userId, this.contactInfo}): super._();
  factory _FamilyMember.fromJson(Map<String, dynamic> json) => _$FamilyMemberFromJson(json);

@override final  int id;
@override final  String relationship;
@override final  int linkedResidentId;
// Mapeamos el objeto anidado "fullName"
@override final  FamilyNameDto fullName;
// El backend devuelve "userId": { "value": 9 }, extraemos el valor
@override@JsonKey(fromJson: _userIdFromJson) final  int userId;
@override final  String? contactInfo;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyMemberCopyWith<_FamilyMember> get copyWith => __$FamilyMemberCopyWithImpl<_FamilyMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyMember&&(identical(other.id, id) || other.id == id)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.linkedResidentId, linkedResidentId) || other.linkedResidentId == linkedResidentId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,relationship,linkedResidentId,fullName,userId,contactInfo);

@override
String toString() {
  return 'FamilyMember(id: $id, relationship: $relationship, linkedResidentId: $linkedResidentId, fullName: $fullName, userId: $userId, contactInfo: $contactInfo)';
}


}

/// @nodoc
abstract mixin class _$FamilyMemberCopyWith<$Res> implements $FamilyMemberCopyWith<$Res> {
  factory _$FamilyMemberCopyWith(_FamilyMember value, $Res Function(_FamilyMember) _then) = __$FamilyMemberCopyWithImpl;
@override @useResult
$Res call({
 int id, String relationship, int linkedResidentId, FamilyNameDto fullName,@JsonKey(fromJson: _userIdFromJson) int userId, String? contactInfo
});


@override $FamilyNameDtoCopyWith<$Res> get fullName;

}
/// @nodoc
class __$FamilyMemberCopyWithImpl<$Res>
    implements _$FamilyMemberCopyWith<$Res> {
  __$FamilyMemberCopyWithImpl(this._self, this._then);

  final _FamilyMember _self;
  final $Res Function(_FamilyMember) _then;

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? relationship = null,Object? linkedResidentId = null,Object? fullName = null,Object? userId = null,Object? contactInfo = freezed,}) {
  return _then(_FamilyMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,linkedResidentId: null == linkedResidentId ? _self.linkedResidentId : linkedResidentId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as FamilyNameDto,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FamilyMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FamilyNameDtoCopyWith<$Res> get fullName {
  
  return $FamilyNameDtoCopyWith<$Res>(_self.fullName, (value) {
    return _then(_self.copyWith(fullName: value));
  });
}
}


/// @nodoc
mixin _$FamilyNameDto {

 String get firstName; String get lastName;
/// Create a copy of FamilyNameDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilyNameDtoCopyWith<FamilyNameDto> get copyWith => _$FamilyNameDtoCopyWithImpl<FamilyNameDto>(this as FamilyNameDto, _$identity);

  /// Serializes this FamilyNameDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilyNameDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'FamilyNameDto(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $FamilyNameDtoCopyWith<$Res>  {
  factory $FamilyNameDtoCopyWith(FamilyNameDto value, $Res Function(FamilyNameDto) _then) = _$FamilyNameDtoCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class _$FamilyNameDtoCopyWithImpl<$Res>
    implements $FamilyNameDtoCopyWith<$Res> {
  _$FamilyNameDtoCopyWithImpl(this._self, this._then);

  final FamilyNameDto _self;
  final $Res Function(FamilyNameDto) _then;

/// Create a copy of FamilyNameDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilyNameDto].
extension FamilyNameDtoPatterns on FamilyNameDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilyNameDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilyNameDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilyNameDto value)  $default,){
final _that = this;
switch (_that) {
case _FamilyNameDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilyNameDto value)?  $default,){
final _that = this;
switch (_that) {
case _FamilyNameDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilyNameDto() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName)  $default,) {final _that = this;
switch (_that) {
case _FamilyNameDto():
return $default(_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName)?  $default,) {final _that = this;
switch (_that) {
case _FamilyNameDto() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilyNameDto implements FamilyNameDto {
  const _FamilyNameDto({required this.firstName, required this.lastName});
  factory _FamilyNameDto.fromJson(Map<String, dynamic> json) => _$FamilyNameDtoFromJson(json);

@override final  String firstName;
@override final  String lastName;

/// Create a copy of FamilyNameDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilyNameDtoCopyWith<_FamilyNameDto> get copyWith => __$FamilyNameDtoCopyWithImpl<_FamilyNameDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilyNameDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilyNameDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'FamilyNameDto(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$FamilyNameDtoCopyWith<$Res> implements $FamilyNameDtoCopyWith<$Res> {
  factory _$FamilyNameDtoCopyWith(_FamilyNameDto value, $Res Function(_FamilyNameDto) _then) = __$FamilyNameDtoCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class __$FamilyNameDtoCopyWithImpl<$Res>
    implements _$FamilyNameDtoCopyWith<$Res> {
  __$FamilyNameDtoCopyWithImpl(this._self, this._then);

  final _FamilyNameDto _self;
  final $Res Function(_FamilyNameDto) _then;

/// Create a copy of FamilyNameDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_FamilyNameDto(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
