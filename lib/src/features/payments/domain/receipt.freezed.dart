// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Receipt {

 int get receiptId; DateTime get issueDate; DateTime get dueDate; double get totalAmount; bool get status; int get residentId; int? get paymentId; DateTime? get paymentDate; double? get amountPaid; int? get paymentMethod; String? get type;
/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptCopyWith<Receipt> get copyWith => _$ReceiptCopyWithImpl<Receipt>(this as Receipt, _$identity);

  /// Serializes this Receipt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Receipt&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptId,issueDate,dueDate,totalAmount,status,residentId,paymentId,paymentDate,amountPaid,paymentMethod,type);

@override
String toString() {
  return 'Receipt(receiptId: $receiptId, issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, status: $status, residentId: $residentId, paymentId: $paymentId, paymentDate: $paymentDate, amountPaid: $amountPaid, paymentMethod: $paymentMethod, type: $type)';
}


}

/// @nodoc
abstract mixin class $ReceiptCopyWith<$Res>  {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) _then) = _$ReceiptCopyWithImpl;
@useResult
$Res call({
 int receiptId, DateTime issueDate, DateTime dueDate, double totalAmount, bool status, int residentId, int? paymentId, DateTime? paymentDate, double? amountPaid, int? paymentMethod, String? type
});




}
/// @nodoc
class _$ReceiptCopyWithImpl<$Res>
    implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._self, this._then);

  final Receipt _self;
  final $Res Function(Receipt) _then;

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiptId = null,Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? status = null,Object? residentId = null,Object? paymentId = freezed,Object? paymentDate = freezed,Object? amountPaid = freezed,Object? paymentMethod = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
receiptId: null == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as int,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [Receipt].
extension ReceiptPatterns on Receipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Receipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Receipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Receipt value)  $default,){
final _that = this;
switch (_that) {
case _Receipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Receipt value)?  $default,){
final _that = this;
switch (_that) {
case _Receipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int receiptId,  DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Receipt() when $default != null:
return $default(_that.receiptId,_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int receiptId,  DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)  $default,) {final _that = this;
switch (_that) {
case _Receipt():
return $default(_that.receiptId,_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int receiptId,  DateTime issueDate,  DateTime dueDate,  double totalAmount,  bool status,  int residentId,  int? paymentId,  DateTime? paymentDate,  double? amountPaid,  int? paymentMethod,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _Receipt() when $default != null:
return $default(_that.receiptId,_that.issueDate,_that.dueDate,_that.totalAmount,_that.status,_that.residentId,_that.paymentId,_that.paymentDate,_that.amountPaid,_that.paymentMethod,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Receipt extends Receipt {
  const _Receipt({required this.receiptId, required this.issueDate, required this.dueDate, required this.totalAmount, required this.status, required this.residentId, this.paymentId, this.paymentDate, this.amountPaid, this.paymentMethod, this.type}): super._();
  factory _Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

@override final  int receiptId;
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

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptCopyWith<_Receipt> get copyWith => __$ReceiptCopyWithImpl<_Receipt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Receipt&&(identical(other.receiptId, receiptId) || other.receiptId == receiptId)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.residentId, residentId) || other.residentId == residentId)&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiptId,issueDate,dueDate,totalAmount,status,residentId,paymentId,paymentDate,amountPaid,paymentMethod,type);

@override
String toString() {
  return 'Receipt(receiptId: $receiptId, issueDate: $issueDate, dueDate: $dueDate, totalAmount: $totalAmount, status: $status, residentId: $residentId, paymentId: $paymentId, paymentDate: $paymentDate, amountPaid: $amountPaid, paymentMethod: $paymentMethod, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ReceiptCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$ReceiptCopyWith(_Receipt value, $Res Function(_Receipt) _then) = __$ReceiptCopyWithImpl;
@override @useResult
$Res call({
 int receiptId, DateTime issueDate, DateTime dueDate, double totalAmount, bool status, int residentId, int? paymentId, DateTime? paymentDate, double? amountPaid, int? paymentMethod, String? type
});




}
/// @nodoc
class __$ReceiptCopyWithImpl<$Res>
    implements _$ReceiptCopyWith<$Res> {
  __$ReceiptCopyWithImpl(this._self, this._then);

  final _Receipt _self;
  final $Res Function(_Receipt) _then;

/// Create a copy of Receipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiptId = null,Object? issueDate = null,Object? dueDate = null,Object? totalAmount = null,Object? status = null,Object? residentId = null,Object? paymentId = freezed,Object? paymentDate = freezed,Object? amountPaid = freezed,Object? paymentMethod = freezed,Object? type = freezed,}) {
  return _then(_Receipt(
receiptId: null == receiptId ? _self.receiptId : receiptId // ignore: cast_nullable_to_non_nullable
as int,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
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
