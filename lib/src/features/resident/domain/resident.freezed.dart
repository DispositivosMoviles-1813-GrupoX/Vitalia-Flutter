// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Resident {

 int get id; String get firstName; String get lastName; String get dni;// Backend doesn't seem to return age directly in the resource, but we can calculate it or add it if available.
// For now, let's assume the backend might provide birthDate or we keep age if it's there.
// Looking at the controller, ResidentResource is returned. Let's assume it has basic info.
// We'll add nullable fields for details that might not be in the list view.
 String? get photoUrl; String? get status; String? get emergencyContact; String? get allergies; String? get conditions; String? get address;
/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentCopyWith<Resident> get copyWith => _$ResidentCopyWithImpl<Resident>(this as Resident, _$identity);

  /// Serializes this Resident to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dni,photoUrl,status,emergencyContact,allergies,conditions,address);

@override
String toString() {
  return 'Resident(id: $id, firstName: $firstName, lastName: $lastName, dni: $dni, photoUrl: $photoUrl, status: $status, emergencyContact: $emergencyContact, allergies: $allergies, conditions: $conditions, address: $address)';
}


}

/// @nodoc
abstract mixin class $ResidentCopyWith<$Res>  {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) _then) = _$ResidentCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String lastName, String dni, String? photoUrl, String? status, String? emergencyContact, String? allergies, String? conditions, String? address
});




}
/// @nodoc
class _$ResidentCopyWithImpl<$Res>
    implements $ResidentCopyWith<$Res> {
  _$ResidentCopyWithImpl(this._self, this._then);

  final Resident _self;
  final $Res Function(Resident) _then;

/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dni = null,Object? photoUrl = freezed,Object? status = freezed,Object? emergencyContact = freezed,Object? allergies = freezed,Object? conditions = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dni: null == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resident].
extension ResidentPatterns on Resident {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resident value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resident() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resident value)  $default,){
final _that = this;
switch (_that) {
case _Resident():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resident value)?  $default,){
final _that = this;
switch (_that) {
case _Resident() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String dni,  String? photoUrl,  String? status,  String? emergencyContact,  String? allergies,  String? conditions,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dni,_that.photoUrl,_that.status,_that.emergencyContact,_that.allergies,_that.conditions,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String lastName,  String dni,  String? photoUrl,  String? status,  String? emergencyContact,  String? allergies,  String? conditions,  String? address)  $default,) {final _that = this;
switch (_that) {
case _Resident():
return $default(_that.id,_that.firstName,_that.lastName,_that.dni,_that.photoUrl,_that.status,_that.emergencyContact,_that.allergies,_that.conditions,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String lastName,  String dni,  String? photoUrl,  String? status,  String? emergencyContact,  String? allergies,  String? conditions,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dni,_that.photoUrl,_that.status,_that.emergencyContact,_that.allergies,_that.conditions,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resident extends Resident {
  const _Resident({required this.id, required this.firstName, required this.lastName, required this.dni, this.photoUrl, this.status, this.emergencyContact, this.allergies, this.conditions, this.address}): super._();
  factory _Resident.fromJson(Map<String, dynamic> json) => _$ResidentFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String lastName;
@override final  String dni;
// Backend doesn't seem to return age directly in the resource, but we can calculate it or add it if available.
// For now, let's assume the backend might provide birthDate or we keep age if it's there.
// Looking at the controller, ResidentResource is returned. Let's assume it has basic info.
// We'll add nullable fields for details that might not be in the list view.
@override final  String? photoUrl;
@override final  String? status;
@override final  String? emergencyContact;
@override final  String? allergies;
@override final  String? conditions;
@override final  String? address;

/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidentCopyWith<_Resident> get copyWith => __$ResidentCopyWithImpl<_Resident>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.allergies, allergies) || other.allergies == allergies)&&(identical(other.conditions, conditions) || other.conditions == conditions)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dni,photoUrl,status,emergencyContact,allergies,conditions,address);

@override
String toString() {
  return 'Resident(id: $id, firstName: $firstName, lastName: $lastName, dni: $dni, photoUrl: $photoUrl, status: $status, emergencyContact: $emergencyContact, allergies: $allergies, conditions: $conditions, address: $address)';
}


}

/// @nodoc
abstract mixin class _$ResidentCopyWith<$Res> implements $ResidentCopyWith<$Res> {
  factory _$ResidentCopyWith(_Resident value, $Res Function(_Resident) _then) = __$ResidentCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String lastName, String dni, String? photoUrl, String? status, String? emergencyContact, String? allergies, String? conditions, String? address
});




}
/// @nodoc
class __$ResidentCopyWithImpl<$Res>
    implements _$ResidentCopyWith<$Res> {
  __$ResidentCopyWithImpl(this._self, this._then);

  final _Resident _self;
  final $Res Function(_Resident) _then;

/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dni = null,Object? photoUrl = freezed,Object? status = freezed,Object? emergencyContact = freezed,Object? allergies = freezed,Object? conditions = freezed,Object? address = freezed,}) {
  return _then(_Resident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dni: null == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,allergies: freezed == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as String?,conditions: freezed == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
