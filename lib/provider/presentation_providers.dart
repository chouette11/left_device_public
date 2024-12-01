import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:left_device/provider/domain_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/repository/button_repository.dart';
import 'package:left_device/repository/ip_address_repository.dart';
import 'package:left_device/repository/template_repository.dart';
import 'package:left_device/util/enum/template.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'presentation_providers.g.dart';

final uidProvider = StateProvider<String>((ref) =>
    ref.read(firebaseAuthProvider).currentUser?.uid ?? const Uuid().v4());

///
/// Root
///

final ipAddressStreamProvider = StreamProvider(
  (ref) => ref.watch(ipAddressRepositoryProvider).getIpAddressStream(),
);

final templatesProvider = FutureProvider.autoDispose((ref) async {
  final templates = await ref.read(templateRepositoryProvider).getTemplates();
  return templates;
});

final ipAddressProvider = StateProvider((_) => '');

final isWindowsProvider = StateProvider((_) => true);

final isBluetoothProvider = StateProvider((_) => true);

final serviceProvider = StateProvider<BluetoothService?>((_) => null);

final selectedTemplateProvider = StateProvider<TemplateEntity?>((_) => null);

///
/// Template
///

final buttonStreamProvider = StreamProvider(
  (ref) => ref.watch(buttonRepositoryProvider).getButtonStream(),
);

final selectedTemplateTypeProvider = StateProvider((_) => TemplateEnum.numericLeftBottom);

@riverpod
class ButtonMap extends _$ButtonMap {
  @override
  Map<int, ButtonEntity> build() {
    return {};
  }

  void set(Map<int, ButtonEntity> buttonMap) {
    state = buttonMap;
  }

  void add(Map<int, ButtonEntity> buttonMap) {
    Map<int, ButtonEntity> tmpMap = {};
    tmpMap.addAll(state);
    tmpMap.addAll(buttonMap);
    state = tmpMap;
  }

  void update(int index, ButtonEntity buttonEntity) {
    Map<int, ButtonEntity> tmpMap = {};
    for (int i = 1; i <= state.length; i++) {
      if (i == index) {
        tmpMap.addAll({i: buttonEntity});
      } else {
        tmpMap.addAll({i: state[i]!});
      }
    }
    state = tmpMap;
  }
}

///
/// Button
///

final windowsKeyProvider = StateProvider((_) => '');

final macKeyProvider = StateProvider((_) => '');

final appOpenProvider = StateProvider((_) => '');

