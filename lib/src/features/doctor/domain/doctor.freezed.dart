// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Doctor {

 int get id; String get specialty;// Mapeamos el objeto "fullName" del JSON
@JsonKey(name: 'fullName') DoctorNameDto get nameData;// Mapeamos el objeto "contactInfo" del JSON (puede ser null?)
@JsonKey(name: 'contactInfo') DoctorContactDto? get contactData;// Otros campos raíz
 String? get licenseNumber; String? get photoUrl; String? get email;
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorCopyWith<Doctor> get copyWith => _$DoctorCopyWithImpl<Doctor>(this as Doctor, _$identity);

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.nameData, nameData) || other.nameData == nameData)&&(identical(other.contactData, contactData) || other.contactData == contactData)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,specialty,nameData,contactData,licenseNumber,photoUrl,email);

@override
String toString() {
  return 'Doctor(id: $id, specialty: $specialty, nameData: $nameData, contactData: $contactData, licenseNumber: $licenseNumber, photoUrl: $photoUrl, email: $email)';
}


}

/// @nodoc
abstract mixin class $DoctorCopyWith<$Res>  {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) _then) = _$DoctorCopyWithImpl;
@useResult
$Res call({
 int id, String specialty,@JsonKey(name: 'fullName') DoctorNameDto nameData,@JsonKey(name: 'contactInfo') DoctorContactDto? contactData, String? licenseNumber, String? photoUrl, String? email
});


$DoctorNameDtoCopyWith<$Res> get nameData;$DoctorContactDtoCopyWith<$Res>? get contactData;

}
/// @nodoc
class _$DoctorCopyWithImpl<$Res>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._self, this._then);

  final Doctor _self;
  final $Res Function(Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? specialty = null,Object? nameData = null,Object? contactData = freezed,Object? licenseNumber = freezed,Object? photoUrl = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,nameData: null == nameData ? _self.nameData : nameData // ignore: cast_nullable_to_non_nullable
as DoctorNameDto,contactData: freezed == contactData ? _self.contactData : contactData // ignore: cast_nullable_to_non_nullable
as DoctorContactDto?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorNameDtoCopyWith<$Res> get nameData {
  
  return $DoctorNameDtoCopyWith<$Res>(_self.nameData, (value) {
    return _then(_self.copyWith(nameData: value));
  });
}/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorContactDtoCopyWith<$Res>? get contactData {
    if (_self.contactData == null) {
    return null;
  }

  return $DoctorContactDtoCopyWith<$Res>(_self.contactData!, (value) {
    return _then(_self.copyWith(contactData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Doctor].
extension DoctorPatterns on Doctor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Doctor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Doctor value)  $default,){
final _that = this;
switch (_that) {
case _Doctor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Doctor value)?  $default,){
final _that = this;
switch (_that) {
case _Doctor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String specialty, @JsonKey(name: 'fullName')  DoctorNameDto nameData, @JsonKey(name: 'contactInfo')  DoctorContactDto? contactData,  String? licenseNumber,  String? photoUrl,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.specialty,_that.nameData,_that.contactData,_that.licenseNumber,_that.photoUrl,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String specialty, @JsonKey(name: 'fullName')  DoctorNameDto nameData, @JsonKey(name: 'contactInfo')  DoctorContactDto? contactData,  String? licenseNumber,  String? photoUrl,  String? email)  $default,) {final _that = this;
switch (_that) {
case _Doctor():
return $default(_that.id,_that.specialty,_that.nameData,_that.contactData,_that.licenseNumber,_that.photoUrl,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String specialty, @JsonKey(name: 'fullName')  DoctorNameDto nameData, @JsonKey(name: 'contactInfo')  DoctorContactDto? contactData,  String? licenseNumber,  String? photoUrl,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _Doctor() when $default != null:
return $default(_that.id,_that.specialty,_that.nameData,_that.contactData,_that.licenseNumber,_that.photoUrl,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Doctor extends Doctor {
  const _Doctor({required this.id, required this.specialty, @JsonKey(name: 'fullName') required this.nameData, @JsonKey(name: 'contactInfo') this.contactData, this.licenseNumber, this.photoUrl, this.email}): super._();
  factory _Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

@override final  int id;
@override final  String specialty;
// Mapeamos el objeto "fullName" del JSON
@override@JsonKey(name: 'fullName') final  DoctorNameDto nameData;
// Mapeamos el objeto "contactInfo" del JSON (puede ser null?)
@override@JsonKey(name: 'contactInfo') final  DoctorContactDto? contactData;
// Otros campos raíz
@override final  String? licenseNumber;
@override final  String? photoUrl;
@override final  String? email;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorCopyWith<_Doctor> get copyWith => __$DoctorCopyWithImpl<_Doctor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Doctor&&(identical(other.id, id) || other.id == id)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.nameData, nameData) || other.nameData == nameData)&&(identical(other.contactData, contactData) || other.contactData == contactData)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,specialty,nameData,contactData,licenseNumber,photoUrl,email);

@override
String toString() {
  return 'Doctor(id: $id, specialty: $specialty, nameData: $nameData, contactData: $contactData, licenseNumber: $licenseNumber, photoUrl: $photoUrl, email: $email)';
}


}

/// @nodoc
abstract mixin class _$DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$DoctorCopyWith(_Doctor value, $Res Function(_Doctor) _then) = __$DoctorCopyWithImpl;
@override @useResult
$Res call({
 int id, String specialty,@JsonKey(name: 'fullName') DoctorNameDto nameData,@JsonKey(name: 'contactInfo') DoctorContactDto? contactData, String? licenseNumber, String? photoUrl, String? email
});


@override $DoctorNameDtoCopyWith<$Res> get nameData;@override $DoctorContactDtoCopyWith<$Res>? get contactData;

}
/// @nodoc
class __$DoctorCopyWithImpl<$Res>
    implements _$DoctorCopyWith<$Res> {
  __$DoctorCopyWithImpl(this._self, this._then);

  final _Doctor _self;
  final $Res Function(_Doctor) _then;

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? specialty = null,Object? nameData = null,Object? contactData = freezed,Object? licenseNumber = freezed,Object? photoUrl = freezed,Object? email = freezed,}) {
  return _then(_Doctor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,specialty: null == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String,nameData: null == nameData ? _self.nameData : nameData // ignore: cast_nullable_to_non_nullable
as DoctorNameDto,contactData: freezed == contactData ? _self.contactData : contactData // ignore: cast_nullable_to_non_nullable
as DoctorContactDto?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorNameDtoCopyWith<$Res> get nameData {
  
  return $DoctorNameDtoCopyWith<$Res>(_self.nameData, (value) {
    return _then(_self.copyWith(nameData: value));
  });
}/// Create a copy of Doctor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DoctorContactDtoCopyWith<$Res>? get contactData {
    if (_self.contactData == null) {
    return null;
  }

  return $DoctorContactDtoCopyWith<$Res>(_self.contactData!, (value) {
    return _then(_self.copyWith(contactData: value));
  });
}
}


/// @nodoc
mixin _$DoctorNameDto {

 String get firstName; String get lastName;
/// Create a copy of DoctorNameDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorNameDtoCopyWith<DoctorNameDto> get copyWith => _$DoctorNameDtoCopyWithImpl<DoctorNameDto>(this as DoctorNameDto, _$identity);

  /// Serializes this DoctorNameDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorNameDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'DoctorNameDto(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $DoctorNameDtoCopyWith<$Res>  {
  factory $DoctorNameDtoCopyWith(DoctorNameDto value, $Res Function(DoctorNameDto) _then) = _$DoctorNameDtoCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class _$DoctorNameDtoCopyWithImpl<$Res>
    implements $DoctorNameDtoCopyWith<$Res> {
  _$DoctorNameDtoCopyWithImpl(this._self, this._then);

  final DoctorNameDto _self;
  final $Res Function(DoctorNameDto) _then;

/// Create a copy of DoctorNameDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorNameDto].
extension DoctorNameDtoPatterns on DoctorNameDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorNameDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorNameDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorNameDto value)  $default,){
final _that = this;
switch (_that) {
case _DoctorNameDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorNameDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorNameDto() when $default != null:
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
case _DoctorNameDto() when $default != null:
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
case _DoctorNameDto():
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
case _DoctorNameDto() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorNameDto implements DoctorNameDto {
  const _DoctorNameDto({required this.firstName, required this.lastName});
  factory _DoctorNameDto.fromJson(Map<String, dynamic> json) => _$DoctorNameDtoFromJson(json);

@override final  String firstName;
@override final  String lastName;

/// Create a copy of DoctorNameDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorNameDtoCopyWith<_DoctorNameDto> get copyWith => __$DoctorNameDtoCopyWithImpl<_DoctorNameDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorNameDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorNameDto&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'DoctorNameDto(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$DoctorNameDtoCopyWith<$Res> implements $DoctorNameDtoCopyWith<$Res> {
  factory _$DoctorNameDtoCopyWith(_DoctorNameDto value, $Res Function(_DoctorNameDto) _then) = __$DoctorNameDtoCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class __$DoctorNameDtoCopyWithImpl<$Res>
    implements _$DoctorNameDtoCopyWith<$Res> {
  __$DoctorNameDtoCopyWithImpl(this._self, this._then);

  final _DoctorNameDto _self;
  final $Res Function(_DoctorNameDto) _then;

/// Create a copy of DoctorNameDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_DoctorNameDto(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DoctorContactDto {

 String? get phone;
/// Create a copy of DoctorContactDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorContactDtoCopyWith<DoctorContactDto> get copyWith => _$DoctorContactDtoCopyWithImpl<DoctorContactDto>(this as DoctorContactDto, _$identity);

  /// Serializes this DoctorContactDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorContactDto&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'DoctorContactDto(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $DoctorContactDtoCopyWith<$Res>  {
  factory $DoctorContactDtoCopyWith(DoctorContactDto value, $Res Function(DoctorContactDto) _then) = _$DoctorContactDtoCopyWithImpl;
@useResult
$Res call({
 String? phone
});




}
/// @nodoc
class _$DoctorContactDtoCopyWithImpl<$Res>
    implements $DoctorContactDtoCopyWith<$Res> {
  _$DoctorContactDtoCopyWithImpl(this._self, this._then);

  final DoctorContactDto _self;
  final $Res Function(DoctorContactDto) _then;

/// Create a copy of DoctorContactDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = freezed,}) {
  return _then(_self.copyWith(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DoctorContactDto].
extension DoctorContactDtoPatterns on DoctorContactDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoctorContactDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoctorContactDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoctorContactDto value)  $default,){
final _that = this;
switch (_that) {
case _DoctorContactDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoctorContactDto value)?  $default,){
final _that = this;
switch (_that) {
case _DoctorContactDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoctorContactDto() when $default != null:
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? phone)  $default,) {final _that = this;
switch (_that) {
case _DoctorContactDto():
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? phone)?  $default,) {final _that = this;
switch (_that) {
case _DoctorContactDto() when $default != null:
return $default(_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DoctorContactDto implements DoctorContactDto {
  const _DoctorContactDto({this.phone});
  factory _DoctorContactDto.fromJson(Map<String, dynamic> json) => _$DoctorContactDtoFromJson(json);

@override final  String? phone;

/// Create a copy of DoctorContactDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoctorContactDtoCopyWith<_DoctorContactDto> get copyWith => __$DoctorContactDtoCopyWithImpl<_DoctorContactDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoctorContactDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoctorContactDto&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'DoctorContactDto(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$DoctorContactDtoCopyWith<$Res> implements $DoctorContactDtoCopyWith<$Res> {
  factory _$DoctorContactDtoCopyWith(_DoctorContactDto value, $Res Function(_DoctorContactDto) _then) = __$DoctorContactDtoCopyWithImpl;
@override @useResult
$Res call({
 String? phone
});




}
/// @nodoc
class __$DoctorContactDtoCopyWithImpl<$Res>
    implements _$DoctorContactDtoCopyWith<$Res> {
  __$DoctorContactDtoCopyWithImpl(this._self, this._then);

  final _DoctorContactDto _self;
  final $Res Function(_DoctorContactDto) _then;

/// Create a copy of DoctorContactDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = freezed,}) {
  return _then(_DoctorContactDto(
phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
