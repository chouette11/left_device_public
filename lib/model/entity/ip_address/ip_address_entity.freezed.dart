// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ip_address_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IPAddressEntity _$IPAddressEntityFromJson(Map<String, dynamic> json) {
  return _IPAddressEntity.fromJson(json);
}

/// @nodoc
mixin _$IPAddressEntity {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get isWindows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IPAddressEntityCopyWith<IPAddressEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IPAddressEntityCopyWith<$Res> {
  factory $IPAddressEntityCopyWith(
          IPAddressEntity value, $Res Function(IPAddressEntity) then) =
      _$IPAddressEntityCopyWithImpl<$Res, IPAddressEntity>;
  @useResult
  $Res call({int? id, String name, String address, bool isWindows});
}

/// @nodoc
class _$IPAddressEntityCopyWithImpl<$Res, $Val extends IPAddressEntity>
    implements $IPAddressEntityCopyWith<$Res> {
  _$IPAddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = null,
    Object? isWindows = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isWindows: null == isWindows
          ? _value.isWindows
          : isWindows // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IPAddressEntityImplCopyWith<$Res>
    implements $IPAddressEntityCopyWith<$Res> {
  factory _$$IPAddressEntityImplCopyWith(_$IPAddressEntityImpl value,
          $Res Function(_$IPAddressEntityImpl) then) =
      __$$IPAddressEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, String address, bool isWindows});
}

/// @nodoc
class __$$IPAddressEntityImplCopyWithImpl<$Res>
    extends _$IPAddressEntityCopyWithImpl<$Res, _$IPAddressEntityImpl>
    implements _$$IPAddressEntityImplCopyWith<$Res> {
  __$$IPAddressEntityImplCopyWithImpl(
      _$IPAddressEntityImpl _value, $Res Function(_$IPAddressEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? address = null,
    Object? isWindows = null,
  }) {
    return _then(_$IPAddressEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      isWindows: null == isWindows
          ? _value.isWindows
          : isWindows // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IPAddressEntityImpl extends _IPAddressEntity {
  const _$IPAddressEntityImpl(
      {this.id,
      required this.name,
      required this.address,
      required this.isWindows})
      : super._();

  factory _$IPAddressEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$IPAddressEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String address;
  @override
  final bool isWindows;

  @override
  String toString() {
    return 'IPAddressEntity(id: $id, name: $name, address: $address, isWindows: $isWindows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IPAddressEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isWindows, isWindows) ||
                other.isWindows == isWindows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, isWindows);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IPAddressEntityImplCopyWith<_$IPAddressEntityImpl> get copyWith =>
      __$$IPAddressEntityImplCopyWithImpl<_$IPAddressEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IPAddressEntityImplToJson(
      this,
    );
  }
}

abstract class _IPAddressEntity extends IPAddressEntity {
  const factory _IPAddressEntity(
      {final int? id,
      required final String name,
      required final String address,
      required final bool isWindows}) = _$IPAddressEntityImpl;
  const _IPAddressEntity._() : super._();

  factory _IPAddressEntity.fromJson(Map<String, dynamic> json) =
      _$IPAddressEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get address;
  @override
  bool get isWindows;
  @override
  @JsonKey(ignore: true)
  _$$IPAddressEntityImplCopyWith<_$IPAddressEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
