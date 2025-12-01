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

 int get id; String? get dni; String? get firstName; String? get lastName;// Nuevos campos según tu JSON
 String? get city; String? get state; String? get country; String? get street; String? get zipCode; String? get gender; int? get receiptId;// Usamos el converter para manejar "1990-05-11"
@DateOnlyConverter() DateTime? get birthDate;// Campos opcionales que tenías antes (por si el backend los agrega luego)
 String? get status; String? get photoUrl;
/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentCopyWith<Resident> get copyWith => _$ResidentCopyWithImpl<Resident>(this as Resident, _$identity);

  /// Serializes this Resident to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.street, street) || other.street == street)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dni,firstName,lastName,city,state,country,street,zipCode,gender,receiptId,birthDate,status,photoUrl);

@override
String toString() {
  return 'Resident(id: $id, dni: $dni, firstName: $firstName, lastName: $lastName, city: $city, state: $state, country: $country, street: $street, zipCode: $zipCode, gender: $gender, receiptId: $receiptId, birthDate: $birthDate, status: $status, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $ResidentCopyWith<$Res>  {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) _then) = _$ResidentCopyWithImpl;
@useResult
$Res call({
 int id, String? dni, String? firstName, String? lastName, String? city, String? state, String? country, String? street, String? zipCode, String? gender, int? receiptId,@DateOnlyConverter() DateTime? birthDate, String? status, String? photoUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dni = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? street = freezed,Object? zipCode = freezed,Object? gender = freezed,Object? receiptId = freezed,Object? birthDate = freezed,Object? status = freezed,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dni: freezed == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,receiptId: freezed == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as int?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? dni,  String? firstName,  String? lastName,  String? city,  String? state,  String? country,  String? street,  String? zipCode,  String? gender,  int? receiptId, @DateOnlyConverter()  DateTime? birthDate,  String? status,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.dni,_that.firstName,_that.lastName,_that.city,_that.state,_that.country,_that.street,_that.zipCode,_that.gender,_that.receiptId,_that.birthDate,_that.status,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? dni,  String? firstName,  String? lastName,  String? city,  String? state,  String? country,  String? street,  String? zipCode,  String? gender,  int? receiptId, @DateOnlyConverter()  DateTime? birthDate,  String? status,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _Resident():
return $default(_that.id,_that.dni,_that.firstName,_that.lastName,_that.city,_that.state,_that.country,_that.street,_that.zipCode,_that.gender,_that.receiptId,_that.birthDate,_that.status,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? dni,  String? firstName,  String? lastName,  String? city,  String? state,  String? country,  String? street,  String? zipCode,  String? gender,  int? receiptId, @DateOnlyConverter()  DateTime? birthDate,  String? status,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.dni,_that.firstName,_that.lastName,_that.city,_that.state,_that.country,_that.street,_that.zipCode,_that.gender,_that.receiptId,_that.birthDate,_that.status,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resident extends Resident {
  const _Resident({required this.id, this.dni, this.firstName, this.lastName, this.city, this.state, this.country, this.street, this.zipCode, this.gender, this.receiptId, @DateOnlyConverter() this.birthDate, this.status, this.photoUrl}): super._();
  factory _Resident.fromJson(Map<String, dynamic> json) => _$ResidentFromJson(json);

@override final  int id;
@override final  String? dni;
@override final  String? firstName;
@override final  String? lastName;
// Nuevos campos según tu JSON
@override final  String? city;
@override final  String? state;
@override final  String? country;
@override final  String? street;
@override final  String? zipCode;
@override final  String? gender;
@override final  int? receiptId;
// Usamos el converter para manejar "1990-05-11"
@override@DateOnlyConverter() final  DateTime? birthDate;
// Campos opcionales que tenías antes (por si el backend los agrega luego)
@override final  String? status;
@override final  String? photoUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.dni, dni) || other.dni == dni)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.street, street) || other.street == street)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dni,firstName,lastName,city,state,country,street,zipCode,gender,receiptId,birthDate,status,photoUrl);

@override
String toString() {
  return 'Resident(id: $id, dni: $dni, firstName: $firstName, lastName: $lastName, city: $city, state: $state, country: $country, street: $street, zipCode: $zipCode, gender: $gender, receiptId: $receiptId, birthDate: $birthDate, status: $status, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$ResidentCopyWith<$Res> implements $ResidentCopyWith<$Res> {
  factory _$ResidentCopyWith(_Resident value, $Res Function(_Resident) _then) = __$ResidentCopyWithImpl;
@override @useResult
$Res call({
 int id, String? dni, String? firstName, String? lastName, String? city, String? state, String? country, String? street, String? zipCode, String? gender, int? receiptId,@DateOnlyConverter() DateTime? birthDate, String? status, String? photoUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dni = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? city = freezed,Object? state = freezed,Object? country = freezed,Object? street = freezed,Object? zipCode = freezed,Object? gender = freezed,Object? receiptId = freezed,Object? birthDate = freezed,Object? status = freezed,Object? photoUrl = freezed,}) {
  return _then(_Resident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dni: freezed == dni ? _self.dni : dni // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,receiptId: freezed == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as int?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
