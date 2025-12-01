class CreateResidentRequestDto {
  final String dni;
  final String firstName;
  final String lastName;
  final String city;
  final String state;
  final String country;
  final String street;
  final String zipCode;
  final DateTime birthDate;
  final String gender;
  final int? receiptId;

  CreateResidentRequestDto({
    required this.dni,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.state,
    required this.country,
    required this.street,
    required this.zipCode,
    required this.birthDate,
    required this.gender,
    this.receiptId,
  });

  Map<String, dynamic> toJson() => {
    'dni': dni,
    'firstName': firstName,
    'lastName': lastName,
    'city': city,
    'state': state,
    'country': country,
    'street': street,
    'zipCode': zipCode,
    'birthDate': birthDate.toIso8601String(),
    'gender': gender,
    'receiptId': receiptId,
  };
}
