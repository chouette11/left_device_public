// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_address_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IPAddressEntityImpl _$$IPAddressEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$IPAddressEntityImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      address: json['address'] as String,
      isWindows: json['isWindows'] as bool,
    );

Map<String, dynamic> _$$IPAddressEntityImplToJson(
        _$IPAddressEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'isWindows': instance.isWindows,
    };
