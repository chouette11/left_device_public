import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/data/spl/sql.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/util/enum/action.dart';
import 'package:left_device/util/enum/template.dart';

final templateRepositoryProvider =
    Provider<TemplateRepository>((ref) => TemplateRepository(ref));

class TemplateRepository {
  TemplateRepository(this.ref);

  final Ref ref;

  Future<List<TemplateEntity>> getTemplates() async {
    final sql = ref.read(databaseProvider);
    final List<TemplateEntity> templateEntities = [];
    try {
      final templates = await sql.fetchTemplates();
      final buttons = await sql.fetchButtons();
      for (final template in templates) {
        final positions = await sql.fetchPositionsByTemplateId(template.id);
        final buttonMaps = Map.fromIterable(
          positions,
          key: (e) => e.positionId as int,
          value: (e) {
            if (e.buttonId == -1) {
              return const ButtonEntity(
                id: -1,
                label: '広告',
                action: ActionEntity(type: ActionTypeEnum.none, windowsValue: '', macValue: ''),
                isVisible: true,
              );
            }
            final button = buttons.firstWhere((b) => b.id == e.buttonId);
            return ButtonEntity(
              label: button.label,
              color: button.color != null ? Color(button.color!) : null,
              isVisible: button.isVisible,
              image: button.image,
              icon: button.icon,
              action: ActionEntity.fromJson(button.actionData),
            );
          },
        );
        templateEntities.add(
          TemplateEntity(
            id: template.id,
            name: template.name,
            buttonMap: buttonMaps,
            type: template.type == 'numeric'
                ? TemplateEnum.numeric_4
                : TemplateEnum.normal_6,
            isVisible: template.isVisible,
          ),
        );
      }
    } catch (e) {
      print(e);
    }

    return templateEntities;
  }

  Future<void> addTemplate(TemplateEntity templateEntity) async {
    final sql = ref.read(databaseProvider);
    final len = await sql.fetchTemplates();
    templateEntity.buttonMap.forEach((key, value) {
      if (value.id == null) {
        print(value);
      } else {
        sql.createPosition(value.id!, key, len.length + 1);
      }
    });
    sql.createTemplate(templateEntity);
  }

  Future<void> removeTemplate(TemplateEntity templateEntity) async {
    final sql = ref.read(databaseProvider);
    final templateCompanion =
        templateEntity.copyWith.call(isVisible: false).toCompanion();
    sql.updateTemplate(templateCompanion);
  }
}
