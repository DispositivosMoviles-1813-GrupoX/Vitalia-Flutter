import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident.freezed.dart';
part 'resident.g.dart';

@freezed
class Resident with _$Resident {
  const Resident._();

  const factory Resident({
    required int id,
    required String firstName,
    required String lastName,
    required String dni,
    // Backend doesn't seem to return age directly in the resource, but we can calculate it or add it if available.
    // For now, let's assume the backend might provide birthDate or we keep age if it's there.
    // Looking at the controller, ResidentResource is returned. Let's assume it has basic info.
    // We'll add nullable fields for details that might not be in the list view.
    String? photoUrl, 
    String? status,
    String? emergencyContact,
    String? allergies,
    String? conditions,
    String? address,
  }) = _Resident;

  String get fullName => '$firstName $lastName';

  factory Resident.fromJson(Map<String, dynamic> json) =>
      _$ResidentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

