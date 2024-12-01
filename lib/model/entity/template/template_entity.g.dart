// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateEntityImpl _$$TemplateEntityImplFromJson(Map<String, dynamic> json) =>
    _$TemplateEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      buttonMap: (json['buttonMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), ButtonEntity.fromJson(e as Map<String, dynamic>)),
      ),
      type: $enumDecode(_$TemplateEnumEnumMap, json['type']),
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$$TemplateEntityImplToJson(
        _$TemplateEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'buttonMap': instance.buttonMap.map((k, e) => MapEntry(k.toString(), e)),
      'type': _$TemplateEnumEnumMap[instance.type]!,
      'isVisible': instance.isVisible,
    };

const _$TemplateEnumEnumMap = {
  TemplateEnum.numericLeftTop: 'numericLeftTop',
  TemplateEnum.numericLeftBottom: 'numericLeftBottom',
  TemplateEnum.numericRightTop: 'numericRightTop',
  TemplateEnum.numericRightBottom: 'numericRightBottom',
  TemplateEnum.normalLeftTop: 'normalLeftTop',
  TemplateEnum.normalLeftBottom: 'normalLeftBottom',
  TemplateEnum.normalCenterTop: 'normalCenterTop',
  TemplateEnum.normalCenterBottom: 'normalCenterBottom',
  TemplateEnum.normalRightTop: 'normalRightTop',
  TemplateEnum.normalRightBottom: 'normalRightBottom',
  TemplateEnum.numeric_4: 'numeric_4',
  TemplateEnum.normal_6: 'normal_6',
};
