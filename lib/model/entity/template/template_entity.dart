import 'package:drift/drift.dart' as d;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:left_device/data/spl/sql.dart' as s;
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/util/enum/template.dart';

part 'template_entity.freezed.dart';

part 'template_entity.g.dart';

@freezed
class TemplateEntity with _$TemplateEntity {
  const TemplateEntity._();

  const factory TemplateEntity({
    int? id,
    required String name,
    required Map<int, ButtonEntity> buttonMap,
    required TemplateEnum type,
    required bool isVisible,
  }) = _TemplateEntity;

  factory TemplateEntity.fromJson(Map<String, dynamic> json) =>
      _$TemplateEntityFromJson(json);

  s.TemplatesCompanion toCompanion() {
    return s.TemplatesCompanion(
      id: d.Value(id!),
      name: d.Value(name),
      type: d.Value(type.type),
      isVisible: d.Value(isVisible),
    );
  }
}
