// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ButtonEntity _$ButtonEntityFromJson(Map<String, dynamic> json) {
  return _ButtonEntity.fromJson(json);
}

/// @nodoc
mixin _$ButtonEntity {
  int? get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  ActionEntity get action => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonEntityCopyWith<ButtonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonEntityCopyWith<$Res> {
  factory $ButtonEntityCopyWith(
          ButtonEntity value, $Res Function(ButtonEntity) then) =
      _$ButtonEntityCopyWithImpl<$Res, ButtonEntity>;
  @useResult
  $Res call(
      {int? id,
      String label,
      ActionEntity action,
      bool isVisible,
      @ColorConverter() Color? color,
      String? image,
      String? icon});

  $ActionEntityCopyWith<$Res> get action;
}

/// @nodoc
class _$ButtonEntityCopyWithImpl<$Res, $Val extends ButtonEntity>
    implements $ButtonEntityCopyWith<$Res> {
  _$ButtonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = null,
    Object? action = null,
    Object? isVisible = null,
    Object? color = freezed,
    Object? image = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ActionEntity,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActionEntityCopyWith<$Res> get action {
    return $ActionEntityCopyWith<$Res>(_value.action, (value) {
      return _then(_value.copyWith(action: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ButtonEntityImplCopyWith<$Res>
    implements $ButtonEntityCopyWith<$Res> {
  factory _$$ButtonEntityImplCopyWith(
          _$ButtonEntityImpl value, $Res Function(_$ButtonEntityImpl) then) =
      __$$ButtonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String label,
      ActionEntity action,
      bool isVisible,
      @ColorConverter() Color? color,
      String? image,
      String? icon});

  @override
  $ActionEntityCopyWith<$Res> get action;
}

/// @nodoc
class __$$ButtonEntityImplCopyWithImpl<$Res>
    extends _$ButtonEntityCopyWithImpl<$Res, _$ButtonEntityImpl>
    implements _$$ButtonEntityImplCopyWith<$Res> {
  __$$ButtonEntityImplCopyWithImpl(
      _$ButtonEntityImpl _value, $Res Function(_$ButtonEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? label = null,
    Object? action = null,
    Object? isVisible = null,
    Object? color = freezed,
    Object? image = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$ButtonEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ActionEntity,
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ButtonEntityImpl extends _ButtonEntity {
  const _$ButtonEntityImpl(
      {this.id,
      required this.label,
      required this.action,
      required this.isVisible,
      @ColorConverter() this.color,
      this.image,
      this.icon})
      : super._();

  factory _$ButtonEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ButtonEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String label;
  @override
  final ActionEntity action;
  @override
  final bool isVisible;
  @override
  @ColorConverter()
  final Color? color;
  @override
  final String? image;
  @override
  final String? icon;

  @override
  String toString() {
    return 'ButtonEntity(id: $id, label: $label, action: $action, isVisible: $isVisible, color: $color, image: $image, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, label, action, isVisible, color, image, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonEntityImplCopyWith<_$ButtonEntityImpl> get copyWith =>
      __$$ButtonEntityImplCopyWithImpl<_$ButtonEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ButtonEntityImplToJson(
      this,
    );
  }
}

abstract class _ButtonEntity extends ButtonEntity {
  const factory _ButtonEntity(
      {final int? id,
      required final String label,
      required final ActionEntity action,
      required final bool isVisible,
      @ColorConverter() final Color? color,
      final String? image,
      final String? icon}) = _$ButtonEntityImpl;
  const _ButtonEntity._() : super._();

  factory _ButtonEntity.fromJson(Map<String, dynamic> json) =
      _$ButtonEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String get label;
  @override
  ActionEntity get action;
  @override
  bool get isVisible;
  @override
  @ColorConverter()
  Color? get color;
  @override
  String? get image;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$ButtonEntityImplCopyWith<_$ButtonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
