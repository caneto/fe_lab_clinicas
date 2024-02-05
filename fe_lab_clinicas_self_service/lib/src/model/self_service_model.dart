import 'package:flutter/material.dart';

final class SelfServiceModel {
  const SelfServiceModel({
    this.name,
    this.lastname,
  });

  final String? name;
  final String? lastname;

  SelfServiceModel clear() {
    return copyWith(name: () => null, lastname: () => null);
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastname,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastname: lastname != null ? lastname() : this.lastname,
    );
  }
}
