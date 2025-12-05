// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {

 int get id; int get residentId; int get doctorId;@JsonKey(name: 'date')@DateOnlyJsonConverter() DateTime get date;@JsonKey(name: 'time')@TimeOnlyJsonConverter() AppointmentTime get time; String get status;
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentCopyWith<Appointment> get copyWith => _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,residentId,doctorId,date,time,status);

@override
String toString() {
  return 'Appointment(id: $id, residentId: $residentId, doctorId: $doctorId, date: $date, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res>  {
  factory $AppointmentCopyWith(Appointment value, $Res Function(Appointment) _then) = _$AppointmentCopyWithImpl;
@useResult
$Res call({
 int id, int residentId, int doctorId,@JsonKey(name: 'date')@DateOnlyJsonConverter() DateTime date,@JsonKey(name: 'time')@TimeOnlyJsonConverter() AppointmentTime time, String status
});


$AppointmentTimeCopyWith<$Res> get time;

}
/// @nodoc
class _$AppointmentCopyWithImpl<$Res>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? residentId = null,Object? doctorId = null,Object? date = null,Object? time = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AppointmentTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentTimeCopyWith<$Res> get time {
  
  return $AppointmentTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appointment value)  $default,){
final _that = this;
switch (_that) {
case _Appointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appointment value)?  $default,){
final _that = this;
switch (_that) {
case _Appointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int residentId,  int doctorId, @JsonKey(name: 'date')@DateOnlyJsonConverter()  DateTime date, @JsonKey(name: 'time')@TimeOnlyJsonConverter()  AppointmentTime time,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int residentId,  int doctorId, @JsonKey(name: 'date')@DateOnlyJsonConverter()  DateTime date, @JsonKey(name: 'time')@TimeOnlyJsonConverter()  AppointmentTime time,  String status)  $default,) {final _that = this;
switch (_that) {
case _Appointment():
return $default(_that.id,_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int residentId,  int doctorId, @JsonKey(name: 'date')@DateOnlyJsonConverter()  DateTime date, @JsonKey(name: 'time')@TimeOnlyJsonConverter()  AppointmentTime time,  String status)?  $default,) {final _that = this;
switch (_that) {
case _Appointment() when $default != null:
return $default(_that.id,_that.residentId,_that.doctorId,_that.date,_that.time,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Appointment extends Appointment {
  const _Appointment({required this.id, required this.residentId, required this.doctorId, @JsonKey(name: 'date')@DateOnlyJsonConverter() required this.date, @JsonKey(name: 'time')@TimeOnlyJsonConverter() required this.time, required this.status}): super._();
  factory _Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

@override final  int id;
@override final  int residentId;
@override final  int doctorId;
@override@JsonKey(name: 'date')@DateOnlyJsonConverter() final  DateTime date;
@override@JsonKey(name: 'time')@TimeOnlyJsonConverter() final  AppointmentTime time;
@override final  String status;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentCopyWith<_Appointment> get copyWith => __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appointment&&(identical(other.id, id) || other.id == id)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,residentId,doctorId,date,time,status);

@override
String toString() {
  return 'Appointment(id: $id, residentId: $residentId, doctorId: $doctorId, date: $date, time: $time, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res> implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(_Appointment value, $Res Function(_Appointment) _then) = __$AppointmentCopyWithImpl;
@override @useResult
$Res call({
 int id, int residentId, int doctorId,@JsonKey(name: 'date')@DateOnlyJsonConverter() DateTime date,@JsonKey(name: 'time')@TimeOnlyJsonConverter() AppointmentTime time, String status
});


@override $AppointmentTimeCopyWith<$Res> get time;

}
/// @nodoc
class __$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? residentId = null,Object? doctorId = null,Object? date = null,Object? time = null,Object? status = null,}) {
  return _then(_Appointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,doctorId: null == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as AppointmentTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Appointment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentTimeCopyWith<$Res> get time {
  
  return $AppointmentTimeCopyWith<$Res>(_self.time, (value) {
    return _then(_self.copyWith(time: value));
  });
}
}


/// @nodoc
mixin _$AppointmentTime {

 int get hour; int get minute; int get second; int get nano;
/// Create a copy of AppointmentTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentTimeCopyWith<AppointmentTime> get copyWith => _$AppointmentTimeCopyWithImpl<AppointmentTime>(this as AppointmentTime, _$identity);

  /// Serializes this AppointmentTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentTime&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second)&&(identical(other.nano, nano) || other.nano == nano));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hour,minute,second,nano);

@override
String toString() {
  return 'AppointmentTime(hour: $hour, minute: $minute, second: $second, nano: $nano)';
}


}

/// @nodoc
abstract mixin class $AppointmentTimeCopyWith<$Res>  {
  factory $AppointmentTimeCopyWith(AppointmentTime value, $Res Function(AppointmentTime) _then) = _$AppointmentTimeCopyWithImpl;
@useResult
$Res call({
 int hour, int minute, int second, int nano
});




}
/// @nodoc
class _$AppointmentTimeCopyWithImpl<$Res>
    implements $AppointmentTimeCopyWith<$Res> {
  _$AppointmentTimeCopyWithImpl(this._self, this._then);

  final AppointmentTime _self;
  final $Res Function(AppointmentTime) _then;

/// Create a copy of AppointmentTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hour = null,Object? minute = null,Object? second = null,Object? nano = null,}) {
  return _then(_self.copyWith(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,nano: null == nano ? _self.nano : nano // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentTime].
extension AppointmentTimePatterns on AppointmentTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentTime value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentTime value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hour,  int minute,  int second,  int nano)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentTime() when $default != null:
return $default(_that.hour,_that.minute,_that.second,_that.nano);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hour,  int minute,  int second,  int nano)  $default,) {final _that = this;
switch (_that) {
case _AppointmentTime():
return $default(_that.hour,_that.minute,_that.second,_that.nano);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hour,  int minute,  int second,  int nano)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentTime() when $default != null:
return $default(_that.hour,_that.minute,_that.second,_that.nano);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentTime implements AppointmentTime {
  const _AppointmentTime({required this.hour, required this.minute, required this.second, required this.nano});
  factory _AppointmentTime.fromJson(Map<String, dynamic> json) => _$AppointmentTimeFromJson(json);

@override final  int hour;
@override final  int minute;
@override final  int second;
@override final  int nano;

/// Create a copy of AppointmentTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentTimeCopyWith<_AppointmentTime> get copyWith => __$AppointmentTimeCopyWithImpl<_AppointmentTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentTime&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second)&&(identical(other.nano, nano) || other.nano == nano));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hour,minute,second,nano);

@override
String toString() {
  return 'AppointmentTime(hour: $hour, minute: $minute, second: $second, nano: $nano)';
}


}

/// @nodoc
abstract mixin class _$AppointmentTimeCopyWith<$Res> implements $AppointmentTimeCopyWith<$Res> {
  factory _$AppointmentTimeCopyWith(_AppointmentTime value, $Res Function(_AppointmentTime) _then) = __$AppointmentTimeCopyWithImpl;
@override @useResult
$Res call({
 int hour, int minute, int second, int nano
});




}
/// @nodoc
class __$AppointmentTimeCopyWithImpl<$Res>
    implements _$AppointmentTimeCopyWith<$Res> {
  __$AppointmentTimeCopyWithImpl(this._self, this._then);

  final _AppointmentTime _self;
  final $Res Function(_AppointmentTime) _then;

/// Create a copy of AppointmentTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hour = null,Object? minute = null,Object? second = null,Object? nano = null,}) {
  return _then(_AppointmentTime(
hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,nano: null == nano ? _self.nano : nano // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
