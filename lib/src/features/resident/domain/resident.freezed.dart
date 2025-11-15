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

 String get id; String get fullName; int get age; String get photoUrl; String get status; DateTime get lastUpdate;
/// Create a copy of Resident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidentCopyWith<Resident> get copyWith => _$ResidentCopyWithImpl<Resident>(this as Resident, _$identity);

  /// Serializes this Resident to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.age, age) || other.age == age)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,age,photoUrl,status,lastUpdate);

@override
String toString() {
  return 'Resident(id: $id, fullName: $fullName, age: $age, photoUrl: $photoUrl, status: $status, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class $ResidentCopyWith<$Res>  {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) _then) = _$ResidentCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, int age, String photoUrl, String status, DateTime lastUpdate
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? age = null,Object? photoUrl = null,Object? status = null,Object? lastUpdate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  int age,  String photoUrl,  String status,  DateTime lastUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.fullName,_that.age,_that.photoUrl,_that.status,_that.lastUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  int age,  String photoUrl,  String status,  DateTime lastUpdate)  $default,) {final _that = this;
switch (_that) {
case _Resident():
return $default(_that.id,_that.fullName,_that.age,_that.photoUrl,_that.status,_that.lastUpdate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  int age,  String photoUrl,  String status,  DateTime lastUpdate)?  $default,) {final _that = this;
switch (_that) {
case _Resident() when $default != null:
return $default(_that.id,_that.fullName,_that.age,_that.photoUrl,_that.status,_that.lastUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resident implements Resident {
  const _Resident({required this.id, required this.fullName, required this.age, required this.photoUrl, required this.status, required this.lastUpdate});
  factory _Resident.fromJson(Map<String, dynamic> json) => _$ResidentFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  int age;
@override final  String photoUrl;
@override final  String status;
@override final  DateTime lastUpdate;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resident&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.age, age) || other.age == age)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,age,photoUrl,status,lastUpdate);

@override
String toString() {
  return 'Resident(id: $id, fullName: $fullName, age: $age, photoUrl: $photoUrl, status: $status, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class _$ResidentCopyWith<$Res> implements $ResidentCopyWith<$Res> {
  factory _$ResidentCopyWith(_Resident value, $Res Function(_Resident) _then) = __$ResidentCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, int age, String photoUrl, String status, DateTime lastUpdate
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? age = null,Object? photoUrl = null,Object? status = null,Object? lastUpdate = null,}) {
  return _then(_Resident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastUpdate: null == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
