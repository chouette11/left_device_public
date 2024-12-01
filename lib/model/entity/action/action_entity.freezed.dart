// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionEntity _$ActionEntityFromJson(Map<String, dynamic> json) {
  return _ActionEntity.fromJson(json);
}

/// @nodoc
mixin _$ActionEntity {
  ActionTypeEnum get type => throw _privateConstructorUsedError;
  String get windowsValue => throw _privateConstructorUsedError;
  String get macValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionEntityCopyWith<ActionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionEntityCopyWith<$Res> {
  factory $ActionEntityCopyWith(
          ActionEntity value, $Res Function(ActionEntity) then) =
      _$ActionEntityCopyWithImpl<$Res, ActionEntity>;
  @useResult
  $Res call({ActionTypeEnum type, String windowsValue, String macValue});
}

/// @nodoc
class _$ActionEntityCopyWithImpl<$Res, $Val extends ActionEntity>
    implements $ActionEntityCopyWith<$Res> {
  _$ActionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? windowsValue = null,
    Object? macValue = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionTypeEnum,
      windowsValue: null == windowsValue
          ? _value.windowsValue
          : windowsValue // ignore: cast_nullable_to_non_nullable
              as String,
      macValue: null == macValue
          ? _value.macValue
          : macValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionEntityImplCopyWith<$Res>
    implements $ActionEntityCopyWith<$Res> {
  factory _$$ActionEntityImplCopyWith(
          _$ActionEntityImpl value, $Res Function(_$ActionEntityImpl) then) =
      __$$ActionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ActionTypeEnum type, String windowsValue, String macValue});
}

/// @nodoc
class __$$ActionEntityImplCopyWithImpl<$Res>
    extends _$ActionEntityCopyWithImpl<$Res, _$ActionEntityImpl>
    implements _$$ActionEntityImplCopyWith<$Res> {
  __$$ActionEntityImplCopyWithImpl(
      _$ActionEntityImpl _value, $Res Function(_$ActionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? windowsValue = null,
    Object? macValue = null,
  }) {
    return _then(_$ActionEntityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionTypeEnum,
      windowsValue: null == windowsValue
          ? _value.windowsValue
          : windowsValue // ignore: cast_nullable_to_non_nullable
              as String,
      macValue: null == macValue
          ? _value.macValue
          : macValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionEntityImpl extends _ActionEntity {
  const _$ActionEntityImpl(
      {required this.type, required this.windowsValue, required this.macValue})
      : super._();

  factory _$ActionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionEntityImplFromJson(json);

  @override
  final ActionTypeEnum type;
  @override
  final String windowsValue;
  @override
  final String macValue;

  @override
  String toString() {
    return 'ActionEntity(type: $type, windowsValue: $windowsValue, macValue: $macValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.windowsValue, windowsValue) ||
                other.windowsValue == windowsValue) &&
            (identical(other.macValue, macValue) ||
                other.macValue == macValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, windowsValue, macValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      __$$ActionEntityImplCopyWithImpl<_$ActionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionEntityImplToJson(
      this,
    );
  }
}

abstract class _ActionEntity extends ActionEntity {
  const factory _ActionEntity(
      {required final ActionTypeEnum type,
      required final String windowsValue,
      required final String macValue}) = _$ActionEntityImpl;
  const _ActionEntity._() : super._();

  factory _ActionEntity.fromJson(Map<String, dynamic> json) =
      _$ActionEntityImpl.fromJson;

  @override
  ActionTypeEnum get type;
  @override
  String get windowsValue;
  @override
  String get macValue;
  @override
  @JsonKey(ignore: true)
  _$$ActionEntityImplCopyWith<_$ActionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
