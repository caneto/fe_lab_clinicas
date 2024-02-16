import 'package:fe_lab_clinicas_adm/src/models/patient_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient_information_form_model.g.dart';

@JsonEnum(valueField: 'id')
enum PatiantInformationFormStatus {
  waiting('Waiting'),
  checkIn('Checked In'),
  beingAttended('Being Attended');

  final String id;
  const PatiantInformationFormStatus(this.id);
}

@JsonSerializable()
class PatientInformationFormModel {
  PatientInformationFormModel({
    required this.id,
    required this.patient,
    required this.healthInseranceCard,
    required this.medicalOrders,
    required this.password,
    required this.dateCreated,
    required this.status,
  });

  final String id;
  final PatientModel patient;
  @JsonKey(name: 'health_inserance_card')
  final String healthInseranceCard;
  @JsonKey(name: 'medical_order')
  final List<String> medicalOrders;
  final String password;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;
  final PatiantInformationFormStatus status;

  factory PatientInformationFormModel.fromJson(Map<String, dynamic> json) =>
      _$PatientInformationFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientInformationFormModelToJson(this);
}
