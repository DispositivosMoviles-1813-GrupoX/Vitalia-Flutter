import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String username,
    // Backend envía "emailAddress", mapeamos a "email" en Dart
    @JsonKey(name: 'emailAddress') required String email,

    // Backend envía lista ["ROLE_USER"], tomamos el primero o un default
    @JsonKey(fromJson: _roleFromJson) @Default('FAMILY') String role,

    // Estos campos NO vienen en el Auth Response.
    // Deben ser opcionales o llenarse con otra petición
    String? firstName,
    String? lastName,
    String? phone,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    int? residentId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Extrae el primer rol de la lista o devuelve un default
String _roleFromJson(dynamic json) {
  if (json is List && json.isNotEmpty) return json.first.toString();
  if (json is String) return json;
  return 'FAMILY';
}