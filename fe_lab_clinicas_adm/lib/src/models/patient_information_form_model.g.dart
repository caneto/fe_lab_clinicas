// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_information_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientInformationFormModel _$PatientInformationFormModelFromJson(
        Map<String, dynamic> json) =>
    PatientInformationFormModel(
      id: json['id'] as String,
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      healthInseranceCard: json['health_inserance_card'] as String,
      medicalOrders: (json['medical_order'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      password: json['password'] as String,
      dateCreated: DateTime.parse(json['date_created'] as String),
      status:
          $enumDecode(_$PatiantInformationFormStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PatientInformationFormModelToJson(
        PatientInformationFormModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient': instance.patient,
      'health_inserance_card': instance.healthInseranceCard,
      'medical_order': instance.medicalOrders,
      'password': instance.password,
      'date_created': instance.dateCreated.toIso8601String(),
      'status': _$PatiantInformationFormStatusEnumMap[instance.status]!,
    };

const _$PatiantInformationFormStatusEnumMap = {
  PatiantInformationFormStatus.waiting: 'Waiting',
  PatiantInformationFormStatus.checkIn: 'Checked In',
  PatiantInformationFormStatus.beingAttended: 'Being Attended',
};
