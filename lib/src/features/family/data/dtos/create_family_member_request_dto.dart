class CreateFamilyMemberRequestDto {
  final String relationship;
  final int linkedResidentId;
  final FullNameDto fullName;
  final int userId;

  CreateFamilyMemberRequestDto({
    required this.relationship,
    required this.linkedResidentId,
    required this.fullName,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
    'relationship': relationship,
    'linkedResidentId': linkedResidentId,
    'fullName': fullName.toJson(),
    'userId': userId,
  };
}

class FullNameDto {
  final String firstName;
  final String lastName;

  FullNameDto({
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
  };
}