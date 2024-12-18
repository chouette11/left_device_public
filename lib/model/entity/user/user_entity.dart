import 'package:left_device/model/document/user/user_document.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String uid,
    required String token,
  }) = _UserEntity;

  static UserEntity fromDoc(UserDocument userDoc) {
    return UserEntity(
      uid: userDoc.uid,
      token: userDoc.token,
    );
  }

  UserDocument toUserDocument() {
    return UserDocument(
      uid: uid,
      token: token,
    );
  }
}
