import 'package:intl/intl.dart';

class UpdateResidentRequestDto {
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


  UpdateResidentRequestDto({
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

  Map<String, dynamic> toJson() {
    return {
      "dni": dni,
      "firstName": firstName,
      "lastName": lastName,
      "city": city,
      "state": state,
      "country": country,
      "street": street,
      "zipCode": zipCode,
      "birthDate": DateFormat('yyyy-MM-dd').format(birthDate),
      "gender": gender,
      "receiptId": receiptId,
    };
  }
}