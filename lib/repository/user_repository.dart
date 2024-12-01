import 'package:left_device/data/preferences_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository(ref));

class UserRepository {
  UserRepository(this.ref);

  final Ref ref;

  /// ユーザーが起動したかを判別
  Future<bool> getIsLaunch() async {
    final pref = ref.read(preferencesProvider);
    final value = await pref.getBool(PrefKey.isLaunch.name);
    pref.setBool(PrefKey.isLaunch.name, true);
    return value ?? false;
  }
}
