import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/data/spl/sql.dart';
import 'package:left_device/model/entity/ip_address/ip_address_entity.dart';

final ipAddressRepositoryProvider =
    Provider<IpAddressRepository>((ref) => IpAddressRepository(ref));

class IpAddressRepository {
  IpAddressRepository(this.ref);

  final Ref ref;

  /// ストリーム取得
  Stream<List<IPAddressEntity>> getIpAddressStream() {
    final sql = ref.read(databaseProvider);
    return sql.watchIPAddresses().map((e) => e
        .map((e) => IPAddressEntity(id: e.id, name: e.name, address: e.address, isWindows: e.isWindows))
        .toList());
  }

  Future<void> addIpAddress(IPAddressEntity ipAddressEntity) async {
    final sql = ref.read(databaseProvider);
    sql.createAddress(ipAddressEntity);
  }

  Future<void> deleteIPAddress(int id) async {
    final sql = ref.read(databaseProvider);
    sql.deleteIPAddress(id);
  }
}
