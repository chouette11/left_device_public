import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:left_device/data/spl/sql.dart' as s;
import 'package:left_device/model/color_converter.dart';
import 'package:left_device/model/entity/action/action_entity.dart';

part 'button_entity.freezed.dart';

part 'button_entity.g.dart';

@freezed
class ButtonEntity with _$ButtonEntity {
  const ButtonEntity._();

  const factory ButtonEntity({
    int? id,
    required String label,
    required ActionEntity action,
    required bool isVisible,
    @ColorConverter() Color? color,
    String? image,
    String? icon,
  }) = _ButtonEntity;

  factory ButtonEntity.fromJson(Map<String, dynamic> json) =>
      _$ButtonEntityFromJson(json);


  s.ButtonsCompanion toCompanion() {
    return s.ButtonsCompanion(
      id: id != null ? d.Value(id!) : const d.Value.absent(),
      label: d.Value(label),
      isVisible: d.Value(isVisible),
      color: color != null ? d.Value(color!.value) : const d.Value.absent(),
      image: image != null ? d.Value(image!) : const d.Value.absent(),
      icon: icon != null ? d.Value(icon!) : const d.Value.absent(),
    );
  }
}
