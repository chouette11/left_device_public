import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_address_entity.freezed.dart';

part 'ip_address_entity.g.dart';

@freezed
class IPAddressEntity with _$IPAddressEntity {
  const IPAddressEntity._();

  const factory IPAddressEntity({
    int? id,
    required String name,
    required String address,
    required bool isWindows,
  }) = _IPAddressEntity;

  factory IPAddressEntity.fromJson(Map<String, dynamic> json) =>
      _$IPAddressEntityFromJson(json);

}
