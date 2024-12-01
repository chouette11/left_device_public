import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:left_device/data/spl/json_converter.dart';
import 'package:left_device/model/entity/ip_address/ip_address_entity.dart';
import 'package:left_device/model/entity/template/template_entity.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:left_device/model/entity/button/button_entity.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path_provider/path_provider.dart';

part 'sql.g.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

class Buttons extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get label => text()();

  IntColumn get color => integer().nullable()();

  TextColumn get icon => text().nullable()();

  TextColumn get image => text().nullable()();

  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();

  TextColumn get actionType => text()();

  TextColumn get actionData => text().map(const JsonConverter())();
}

class ButtonPositions extends Table {
  IntColumn get buttonId => integer().references(Buttons, #id)();

  IntColumn get positionId => integer()();

  IntColumn get templateId => integer().references(Templates, #id)();
}

class Templates extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get type => text()();

  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();
}

class IPs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get address => text()();

  BoolColumn get isWindows => boolean()();
}

@DriftDatabase(tables: [Buttons, ButtonPositions, Templates, IPs])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/getting-started/#open
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(buttons, buttons.isVisible);
          await m.addColumn(templates, templates.isVisible);
        }
      },
    );
  }

  /// Template

  Future<int> createTemplate(TemplateEntity templateEntity) {
    return into(templates).insert(TemplatesCompanion.insert(
      name: templateEntity.name,
      type: templateEntity.type.type,
      isVisible: Value(templateEntity.isVisible),
    ));
  }

  Future<Template> fetchTemplate(int id) {
    return (select(templates)..where((u) => u.id.equals(id))).getSingle();
  }

  Future<List<Template>> fetchTemplates() {
    return (select(templates)).get();
  }

  Stream<List<Template>> watchTemplates() {
    return (select(templates)).watch();
  }

  Future<void> updateTemplate(TemplatesCompanion templateCompanion) {
    return (update(templates)
          ..where((u) => u.id.equals(templateCompanion.id.value)))
        .write(templateCompanion);
  }

  /// Button

  Future<int> createButton(ButtonEntity buttonEntity) {
    return into(buttons).insert(
      ButtonsCompanion.insert(
        label: buttonEntity.label,
        image: Value(buttonEntity.image),
        isVisible: Value(buttonEntity.isVisible),
        color: Value(buttonEntity.color?.value),
        icon: Value(buttonEntity.icon),
        actionType: buttonEntity.action.type.name,
        actionData: buttonEntity.action.toJson(),
      ),
    );
  }

  Future<void> updateButton(ButtonsCompanion buttonsCompanion) {
    return (update(buttons)
          ..where((u) => u.id.equals(buttonsCompanion.id.value)))
        .write(buttonsCompanion);
  }

  Future<List<Button>> fetchButtons() {
    return (select(buttons)).get();
  }

  Stream<List<Button>> watchButtons() {
    return (select(buttons)).watch();
  }

  /// Position

  Future<int> createPosition(int buttonId, int positionId, int templateId) {
    return into(buttonPositions).insert(
      ButtonPositionsCompanion.insert(
        buttonId: buttonId,
        positionId: positionId,
        templateId: templateId,
      ),
    );
  }

  Future<List<ButtonPosition>> fetchPositionsByTemplateId(int templateId) {
    return (select(buttonPositions)
          ..where((u) => u.templateId.equals(templateId)))
        .get();
  }

  /// Address

  Future<int> createAddress(IPAddressEntity ipAddressEntity) {
    return into(iPs).insert(IPsCompanion.insert(
      name: ipAddressEntity.name,
      address: ipAddressEntity.address,
      isWindows: ipAddressEntity.isWindows
    ));
  }

  Stream<List<IP>> watchIPAddresses() {
    return (select(iPs)).watch();
  }

  Future<void> deleteIPAddress(int id) {
    return (delete(iPs)..where((e) => e.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFloder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFloder.path, 'db.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
