// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateEntity _$TemplateEntityFromJson(Map<String, dynamic> json) {
  return _TemplateEntity.fromJson(json);
}

/// @nodoc
mixin _$TemplateEntity {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<int, ButtonEntity> get buttonMap => throw _privateConstructorUsedError;
  TemplateEnum get type => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateEntityCopyWith<TemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateEntityCopyWith<$Res> {
  factory $TemplateEntityCopyWith(
          TemplateEntity value, $Res Function(TemplateEntity) then) =
      _$TemplateEntityCopyWithImpl<$Res, TemplateEntity>;
  @useResult
  $Res call(
      {int? id,
      String name,
      Map<int, ButtonEntity> buttonMap,
      TemplateEnum type,
      bool isVisible});
}

/// @nodoc
class _$TemplateEntityCopyWithImpl<$Res, $Val extends TemplateEntity>
    implements $TemplateEntityCopyWith<$Res> {
  _$TemplateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? buttonMap = null,
    Object? type = null,
    Object? isVisible = null,
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
      buttonMap: null == buttonMap
          ? _value.buttonMap
          : buttonMap // ignore: cast_nullable_to_non_nullable
              as Map<int, ButtonEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateEnum,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateEntityImplCopyWith<$Res>
    implements $TemplateEntityCopyWith<$Res> {
  factory _$$TemplateEntityImplCopyWith(_$TemplateEntityImpl value,
          $Res Function(_$TemplateEntityImpl) then) =
      __$$TemplateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      Map<int, ButtonEntity> buttonMap,
      TemplateEnum type,
      bool isVisible});
}

/// @nodoc
class __$$TemplateEntityImplCopyWithImpl<$Res>
    extends _$TemplateEntityCopyWithImpl<$Res, _$TemplateEntityImpl>
    implements _$$TemplateEntityImplCopyWith<$Res> {
  __$$TemplateEntityImplCopyWithImpl(
      _$TemplateEntityImpl _value, $Res Function(_$TemplateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? buttonMap = null,
    Object? type = null,
    Object? isVisible = null,
  }) {
    return _then(_$TemplateEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buttonMap: null == buttonMap
          ? _value._buttonMap
          : buttonMap // ignore: cast_nullable_to_non_nullable
              as Map<int, ButtonEntity>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TemplateEnum,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateEntityImpl extends _TemplateEntity {
  const _$TemplateEntityImpl(
      {this.id,
      required this.name,
      required final Map<int, ButtonEntity> buttonMap,
      required this.type,
      required this.isVisible})
      : _buttonMap = buttonMap,
        super._();

  factory _$TemplateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  final Map<int, ButtonEntity> _buttonMap;
  @override
  Map<int, ButtonEntity> get buttonMap {
    if (_buttonMap is EqualUnmodifiableMapView) return _buttonMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_buttonMap);
  }

  @override
  final TemplateEnum type;
  @override
  final bool isVisible;

  @override
  String toString() {
    return 'TemplateEntity(id: $id, name: $name, buttonMap: $buttonMap, type: $type, isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._buttonMap, _buttonMap) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_buttonMap), type, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateEntityImplCopyWith<_$TemplateEntityImpl> get copyWith =>
      __$$TemplateEntityImplCopyWithImpl<_$TemplateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateEntityImplToJson(
      this,
    );
  }
}

abstract class _TemplateEntity extends TemplateEntity {
  const factory _TemplateEntity(
      {final int? id,
      required final String name,
      required final Map<int, ButtonEntity> buttonMap,
      required final TemplateEnum type,
      required final bool isVisible}) = _$TemplateEntityImpl;
  const _TemplateEntity._() : super._();

  factory _TemplateEntity.fromJson(Map<String, dynamic> json) =
      _$TemplateEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  Map<int, ButtonEntity> get buttonMap;
  @override
  TemplateEnum get type;
  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$TemplateEntityImplCopyWith<_$TemplateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
