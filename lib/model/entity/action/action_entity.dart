import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:left_device/util/enum/action.dart';

part 'action_entity.freezed.dart';

part 'action_entity.g.dart';

@freezed
class ActionEntity with _$ActionEntity {
  const ActionEntity._();

  const factory ActionEntity({
    required ActionTypeEnum type,
    required String windowsValue,
    required String macValue,
  }) = _ActionEntity;

  factory ActionEntity.fromJson(Map<String, dynamic> json) =>
      _$ActionEntityFromJson(json);

}
