import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:flutter/material.dart';

final class SelfServiceModel {
  const SelfServiceModel({
    this.name,
    this.lastname,
    this.patient,
  });

  final String? name;
  final String? lastname;
  final PatientModel? patient;

  SelfServiceModel clear() {
    return copyWith(
      name: () => null,
      lastname: () => null,
      patient: () => null,
    );
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastname,
    ValueGetter<PatientModel?>? patient,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastname: lastname != null ? lastname() : this.lastname,
      patient: patient != null ? patient() : this.patient,
    );
  }
}
