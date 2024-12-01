import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/data/spl/sql.dart';
import 'package:left_device/model/entity/action/action_entity.dart';
import 'package:left_device/model/entity/button/button_entity.dart';

final buttonRepositoryProvider =
    Provider<ButtonRepository>((ref) => ButtonRepository(ref));

class ButtonRepository {
  ButtonRepository(this.ref);

  final Ref ref;

  /// ストリーム取得
  Stream<List<ButtonEntity>> getButtonStream() {
    final sql = ref.read(databaseProvider);
    return sql.watchButtons().map((e) => e
        .map(
          (e) => ButtonEntity(
            id: e.id,
            label: e.label,
            isVisible: e.isVisible,
            color: e.color != null ? Color(e.color!) : null,
            image: e.image,
            icon: e.icon,
            action: ActionEntity.fromJson(e.actionData),
          ),
        )
        .toList());
  }

  Future<void> addButton(ButtonEntity buttonEntity) async {
    final sql = ref.read(databaseProvider);
    sql.createButton(buttonEntity);
  }

  Future<void> removeButton(ButtonEntity buttonEntity) async {
    final sql = ref.read(databaseProvider);
    final buttonsCompanion =
        buttonEntity.copyWith.call(isVisible: false).toCompanion();
    await sql.updateButton(buttonsCompanion);
  }
}
