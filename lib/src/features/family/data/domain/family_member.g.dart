// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FamilyMember _$FamilyMemberFromJson(Map<String, dynamic> json) =>
    _FamilyMember(
      id: (json['id'] as num).toInt(),
      relationship: json['relationship'] as String,
      linkedResidentId: (json['linkedResidentId'] as num).toInt(),
      fullName: FamilyNameDto.fromJson(
        json['fullName'] as Map<String, dynamic>,
      ),
      userId: _userIdFromJson(json['userId']),
      contactInfo: json['contactInfo'] as String?,
    );

Map<String, dynamic> _$FamilyMemberToJson(_FamilyMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relationship': instance.relationship,
      'linkedResidentId': instance.linkedResidentId,
      'fullName': instance.fullName,
      'userId': instance.userId,
      'contactInfo': instance.contactInfo,
    };

_FamilyNameDto _$FamilyNameDtoFromJson(Map<String, dynamic> json) =>
    _FamilyNameDto(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$FamilyNameDtoToJson(_FamilyNameDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
