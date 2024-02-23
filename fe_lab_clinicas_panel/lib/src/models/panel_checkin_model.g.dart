// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_checkin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanelCheckinModel _$PanelCheckinModelFromJson(Map<String, dynamic> json) =>
    PanelCheckinModel(
      id: json['id'] as String,
      password: json['password'] as String,
      attendantDesk: json['attendant_desk'] as int,
    );

Map<String, dynamic> _$PanelCheckinModelToJson(PanelCheckinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'attendant_desk': instance.attendantDesk,
    };
