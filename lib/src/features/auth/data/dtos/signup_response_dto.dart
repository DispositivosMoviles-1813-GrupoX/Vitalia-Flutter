import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'signup_response_dto.freezed.dart';
part 'signup_response_dto.g.dart';

@freezed
class SignUpResponseDto with _$SignUpResponseDto {
  const factory SignUpResponseDto({
    required int id,
    required String username,
    required List<String> roles,
  }) = _SignUpResponseDto;

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDtoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

extension SignUpResponseMapper on SignUpResponseDto {
  User toDomain() {
    return User(
      id: id,
      username: username,
      role: roles.isNotEmpty ? roles.first : "FAMILY",
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      dateOfBirth: DateTime(2000, 1, 1),
    );
  }
}
