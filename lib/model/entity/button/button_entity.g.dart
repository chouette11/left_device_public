// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ButtonEntityImpl _$$ButtonEntityImplFromJson(Map<String, dynamic> json) =>
    _$ButtonEntityImpl(
      id: json['id'] as int?,
      label: json['label'] as String,
      action: ActionEntity.fromJson(json['action'] as Map<String, dynamic>),
      isVisible: json['isVisible'] as bool,
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorConverter().fromJson),
      image: json['image'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$ButtonEntityImplToJson(_$ButtonEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'action': instance.action,
      'isVisible': instance.isVisible,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'image': instance.image,
      'icon': instance.icon,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
