// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDocument _$UserDocumentFromJson(Map<String, dynamic> json) {
  return _UserDocument.fromJson(json);
}

/// @nodoc
mixin _$UserDocument {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDocumentCopyWith<UserDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDocumentCopyWith<$Res> {
  factory $UserDocumentCopyWith(
          UserDocument value, $Res Function(UserDocument) then) =
      _$UserDocumentCopyWithImpl<$Res, UserDocument>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid, @JsonKey(name: 'token') String token});
}

/// @nodoc
class _$UserDocumentCopyWithImpl<$Res, $Val extends UserDocument>
    implements $UserDocumentCopyWith<$Res> {
  _$UserDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDocumentImplCopyWith<$Res>
    implements $UserDocumentCopyWith<$Res> {
  factory _$$UserDocumentImplCopyWith(
          _$UserDocumentImpl value, $Res Function(_$UserDocumentImpl) then) =
      __$$UserDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uid') String uid, @JsonKey(name: 'token') String token});
}

/// @nodoc
class __$$UserDocumentImplCopyWithImpl<$Res>
    extends _$UserDocumentCopyWithImpl<$Res, _$UserDocumentImpl>
    implements _$$UserDocumentImplCopyWith<$Res> {
  __$$UserDocumentImplCopyWithImpl(
      _$UserDocumentImpl _value, $Res Function(_$UserDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? token = null,
  }) {
    return _then(_$UserDocumentImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDocumentImpl extends _UserDocument {
  const _$UserDocumentImpl(
      {@JsonKey(name: 'uid') required this.uid,
      @JsonKey(name: 'token') required this.token})
      : super._();

  factory _$UserDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDocumentImplFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'token')
  final String token;

  @override
  String toString() {
    return 'UserDocument(uid: $uid, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDocumentImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDocumentImplCopyWith<_$UserDocumentImpl> get copyWith =>
      __$$UserDocumentImplCopyWithImpl<_$UserDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDocumentImplToJson(
      this,
    );
  }
}

abstract class _UserDocument extends UserDocument {
  const factory _UserDocument(
          {@JsonKey(name: 'uid') required final String uid,
          @JsonKey(name: 'token') required final String token}) =
      _$UserDocumentImpl;
  const _UserDocument._() : super._();

  factory _UserDocument.fromJson(Map<String, dynamic> json) =
      _$UserDocumentImpl.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$UserDocumentImplCopyWith<_$UserDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
