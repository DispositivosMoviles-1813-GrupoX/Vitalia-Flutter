// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_appointment_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAppointmentRequestDto {

 int get residentId; int get doctorId;@DateOnlyJsonConverter() DateTime get date;@TimeOnlyJsonConverter() AppointmentTime get time; String get status;
/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAppointmentRequestDtoCopyWith<CreateAppointmentRequestDto> get copyWith => _$CreateAppointmentRequestDtoCopyWithImpl<CreateAppointmentRequestDto>(this as CreateAppointmentRequestDto, _$identity);

  /// Serializes this CreateAppointmentRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAppointmentRequestDto&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,residentId,doctorId,date,time,status);

@override
String toString() {
  return 'CreateAppointmentRequestDto(residentId: $residentId, doctorId: $doctorId, date: $date, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateAppointmentRequestDtoCopyWith<$Res>  {
  factory $CreateAppointmentRequestDtoCopyWith(CreateAppointmentRequestDto value, $Res Function(CreateAppointmentRequestDto) _then) = _$CreateAppointmentRequestDtoCopyWithImpl;
@useResult
$Res call({
 int residentId, int doctorId,@DateOnlyJsonConverter() DateTime date,@TimeOnlyJsonConverter() AppointmentTime time, String status
});


$AppointmentTimeCopyWith<$Res> get time;

}
/// @nodoc
class _$CreateAppointmentRequestDtoCopyWithImpl<$Res>
    implements $CreateAppointmentRequestDtoCopyWith<$Res> {
  _$CreateAppointmentRequestDtoCopyWithImpl(this._self, this._then);

  final CreateAppointmentRequestDto _self;
  final $Res Function(CreateAppointmentRequestDto) _then;

/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? residentId = null,Object? doctorId = null,Object? date = null,Object? time = null,Object? status = null,}) {
  return _then(_self.copyWith(
residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AppointmentTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentTimeCopyWith<$Res> get time {
  
  return $AppointmentTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateAppointmentRequestDto].
extension CreateAppointmentRequestDtoPatterns on CreateAppointmentRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAppointmentRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAppointmentRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAppointmentRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int residentId,  int doctorId, @DateOnlyJsonConverter()  DateTime date, @TimeOnlyJsonConverter()  AppointmentTime time,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto() when $default != null:
return $default(_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int residentId,  int doctorId, @DateOnlyJsonConverter()  DateTime date, @TimeOnlyJsonConverter()  AppointmentTime time,  String status)  $default,) {final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto():
return $default(_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int residentId,  int doctorId, @DateOnlyJsonConverter()  DateTime date, @TimeOnlyJsonConverter()  AppointmentTime time,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreateAppointmentRequestDto() when $default != null:
return $default(_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAppointmentRequestDto implements CreateAppointmentRequestDto {
  const _CreateAppointmentRequestDto({required this.residentId, required this.doctorId, @DateOnlyJsonConverter() required this.date, @TimeOnlyJsonConverter() required this.time, required this.status});
  factory _CreateAppointmentRequestDto.fromJson(Map<String, dynamic> json) => _$CreateAppointmentRequestDtoFromJson(json);

@override final  int residentId;
@override final  int doctorId;
@override@DateOnlyJsonConverter() final  DateTime date;
@override@TimeOnlyJsonConverter() final  AppointmentTime time;
@override final  String status;

/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAppointmentRequestDtoCopyWith<_CreateAppointmentRequestDto> get copyWith => __$CreateAppointmentRequestDtoCopyWithImpl<_CreateAppointmentRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAppointmentRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAppointmentRequestDto&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,residentId,doctorId,date,time,status);

@override
String toString() {
  return 'CreateAppointmentRequestDto(residentId: $residentId, doctorId: $doctorId, date: $date, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateAppointmentRequestDtoCopyWith<$Res> implements $CreateAppointmentRequestDtoCopyWith<$Res> {
  factory _$CreateAppointmentRequestDtoCopyWith(_CreateAppointmentRequestDto value, $Res Function(_CreateAppointmentRequestDto) _then) = __$CreateAppointmentRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int residentId, int doctorId,@DateOnlyJsonConverter() DateTime date,@TimeOnlyJsonConverter() AppointmentTime time, String status
});


@override $AppointmentTimeCopyWith<$Res> get time;

}
/// @nodoc
class __$CreateAppointmentRequestDtoCopyWithImpl<$Res>
    implements _$CreateAppointmentRequestDtoCopyWith<$Res> {
  __$CreateAppointmentRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateAppointmentRequestDto _self;
  final $Res Function(_CreateAppointmentRequestDto) _then;

/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? residentId = null,Object? doctorId = null,Object? date = null,Object? time = null,Object? status = null,}) {
  return _then(_CreateAppointmentRequestDto(
residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AppointmentTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CreateAppointmentRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentTimeCopyWith<$Res> get time {
  
  return $AppointmentTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}

// dart format on
