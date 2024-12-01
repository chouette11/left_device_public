// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionEntityImpl _$$ActionEntityImplFromJson(Map<String, dynamic> json) =>
    _$ActionEntityImpl(
      type: $enumDecode(_$ActionTypeEnumEnumMap, json['type']),
      windowsValue: json['windowsValue'] as String,
      macValue: json['macValue'] as String,
    );

Map<String, dynamic> _$$ActionEntityImplToJson(_$ActionEntityImpl instance) =>
    <String, dynamic>{
      'type': _$ActionTypeEnumEnumMap[instance.type]!,
      'windowsValue': instance.windowsValue,
      'macValue': instance.macValue,
    };

const _$ActionTypeEnumEnumMap = {
  ActionTypeEnum.hotkey: 'hotkey',
  ActionTypeEnum.appOpen: 'appOpen',
  ActionTypeEnum.typewrite: 'typewrite',
  ActionTypeEnum.none: 'none',
};
