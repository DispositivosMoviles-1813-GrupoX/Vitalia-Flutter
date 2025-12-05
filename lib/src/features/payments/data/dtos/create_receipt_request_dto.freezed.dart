// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_receipt_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReceiptRequestDto {

 DateTime get issueDate; DateTime get dueDate; double get totalAmount; bool get status; int get residentId; int? get paymentId; DateTime? get paymentDate; double? get amountPaid; int? get paymentMethod; String? get type;
/// Create a copy of CreateReceiptRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReceiptRequestDtoCopyWith<CreateReceiptRequestDto> get copyWith => _$CreateReceiptRequestDtoCopyWithImpl<CreateReceiptRequestDto>(this as CreateReceiptRequestDto, _$identity);

  /// Serializes this CreateReceiptRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReceiptRequestDto&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,issueDate,dueDate,totalAmount,status,residentId,paymentId,paymentDate,amountPaid,paymentMethod,type);

@override
String toString() {
  return 'CreateReceiptRequestDto(issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, status: $status, residentId: $residentId, paymentId: $paymentId, paymentDate: $paymentDate, amountPaid: $amountPaid, paymentMethod: $paymentMethod, type: $type)';
}


}

/// @nodoc
abstract mixin class $CreateReceiptRequestDtoCopyWith<$Res>  {
  factory $CreateReceiptRequestDtoCopyWith(CreateReceiptRequestDto value, $Res Function(CreateReceiptRequestDto) _then) = _$CreateReceiptRequestDtoCopyWithImpl;
@useResult
$Res call({
 DateTime issueDate, DateTime dueDate, double totalAmount, bool status, int residentId, int? paymentId, DateTime? paymentDate, double? amountPaid, int? paymentMethod, String? type
});




}
/// @nodoc
class _$CreateReceiptRequestDtoCopyWithImpl<$Res>
    implements $CreateReceiptRequestDtoCopyWith<$Res> {
  _$CreateReceiptRequestDtoCopyWithImpl(this._self, this._then);

  final CreateReceiptRequestDto _self;
  final $Res Function(CreateReceiptRequestDto) _then;

/// Create a copy of CreateReceiptRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? status = null,Object? residentId = null,Object? paymentId = freezed,Object? paymentDate = freezed,Object? amountPaid = freezed,Object? paymentMethod = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int?,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amountPaid: freezed == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateReceiptRequestDto].
extension CreateReceiptRequestDtoPatterns on CreateReceiptRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReceiptRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReceiptRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReceiptRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateReceiptRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReceiptRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReceiptRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReceiptRequestDto() when $default != null:
return $default(_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)  $default,) {final _that = this;
switch (_that) {
case _CreateReceiptRequestDto():
return $default(_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _CreateReceiptRequestDto() when $default != null:
return $default(_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReceiptRequestDto implements CreateReceiptRequestDto {
  const _CreateReceiptRequestDto({required this.issueDate, required this.dueDate, required this.totalAmount, required this.status, required this.residentId, this.paymentId, this.paymentDate, this.amountPaid, this.paymentMethod, this.type});
  factory _CreateReceiptRequestDto.fromJson(Map<String, dynamic> json) => _$CreateReceiptRequestDtoFromJson(json);

@override final  DateTime issueDate;
@override final  DateTime dueDate;
@override final  double totalAmount;
@override final  bool status;
@override final  int residentId;
@override final  int? paymentId;
@override final  DateTime? paymentDate;
@override final  double? amountPaid;
@override final  int? paymentMethod;
@override final  String? type;

/// Create a copy of CreateReceiptRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReceiptRequestDtoCopyWith<_CreateReceiptRequestDto> get copyWith => __$CreateReceiptRequestDtoCopyWithImpl<_CreateReceiptRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReceiptRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReceiptRequestDto&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,issueDate,dueDate,totalAmount,status,residentId,paymentId,paymentDate,amountPaid,paymentMethod,type);

@override
String toString() {
  return 'CreateReceiptRequestDto(issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, status: $status, residentId: $residentId, paymentId: $paymentId, paymentDate: $paymentDate, amountPaid: $amountPaid, paymentMethod: $paymentMethod, type: $type)';
}


}

/// @nodoc
abstract mixin class _$CreateReceiptRequestDtoCopyWith<$Res> implements $CreateReceiptRequestDtoCopyWith<$Res> {
  factory _$CreateReceiptRequestDtoCopyWith(_CreateReceiptRequestDto value, $Res Function(_CreateReceiptRequestDto) _then) = __$CreateReceiptRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 DateTime issueDate, DateTime dueDate, double totalAmount, bool status, int residentId, int? paymentId, DateTime? paymentDate, double? amountPaid, int? paymentMethod, String? type
});




}
/// @nodoc
class __$CreateReceiptRequestDtoCopyWithImpl<$Res>
    implements _$CreateReceiptRequestDtoCopyWith<$Res> {
  __$CreateReceiptRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateReceiptRequestDto _self;
  final $Res Function(_CreateReceiptRequestDto) _then;

/// Create a copy of CreateReceiptRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? status = null,Object? residentId = null,Object? paymentId = freezed,Object? paymentDate = freezed,Object? amountPaid = freezed,Object? paymentMethod = freezed,Object? type = freezed,}) {
  return _then(_CreateReceiptRequestDto(
issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,residentId: null == residentId ? _self.residentId : residentId // ignore: cast_nullable_to_non_nullable
as int,paymentId: freezed == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as int?,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amountPaid: freezed == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
