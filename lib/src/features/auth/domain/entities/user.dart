import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String username,
    required String role,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? profileImageUrl,
    int? residentId,
    @DateOnlyConverter() required DateTime dateOfBirth,
  }) = _User;


  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;

    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) {
    return '${object.year.toString().padLeft(4, '0')}-'
        '${object.month.toString().padLeft(2, '0')}-'
        '${object.day.toString().padLeft(2, '0')}';
  }
}
