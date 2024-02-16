import 'package:fe_lab_clinicas_self_service/src/models/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:flutter/material.dart';

import 'patient_page.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numberEC;
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIdentificationNumberEC.dispose();
  }

  void initializeForm(PatientModel? patient) {
    if(patient != null) {
      nameEC.text = patient.name;
      emailEC.text = patient.email;
      phoneEC.text = patient.phoneNumber;
      documentEC.text = patient.document;
      cepEC.text = patient.address.cep;
      streetEC.text = patient.address.streetAddress;
      numberEC.text = patient.address.number;
      complementEC.text = patient.address.addressComplement;
      stateEC.text = patient.address.state;
      cityEC.text = patient.address.city;
      districtEC.text = patient.address.district;
      guardianEC.text = patient.guardian;
      guardianIdentificationNumberEC.text = patient.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      address: patient.address.copyWith(
        cep: cepEC.text,
        streetAddress: stateEC.text,
        number: numberEC.text,
        addressComplement: complementEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }

  RegisterPatientModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      address: (
        cep: cepEC.text,
        streetAddress: streetEC.text,
        number: numberEC.text,
        addressComplement: complementEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
    );
  }
}
