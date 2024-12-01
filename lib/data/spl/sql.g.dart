// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sql.dart';

// ignore_for_file: type=lint
class $ButtonsTable extends Buttons with TableInfo<$ButtonsTable, Button> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ButtonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isVisibleMeta =
      const VerificationMeta('isVisible');
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
      'is_visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_visible" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _actionTypeMeta =
      const VerificationMeta('actionType');
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
      'action_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionDataMeta =
      const VerificationMeta('actionData');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>, String>
      actionData = GeneratedColumn<String>('action_data', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, dynamic>>(
              $ButtonsTable.$converteractionData);
  @override
  List<GeneratedColumn> get $columns =>
      [id, label, color, icon, image, isVisible, actionType, actionData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buttons';
  @override
  VerificationContext validateIntegrity(Insertable<Button> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta));
    }
    if (data.containsKey('action_type')) {
      context.handle(
          _actionTypeMeta,
          actionType.isAcceptableOrUnknown(
              data['action_type']!, _actionTypeMeta));
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    context.handle(_actionDataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Button map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Button(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      isVisible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_visible'])!,
      actionType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_type'])!,
      actionData: $ButtonsTable.$converteractionData.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_data'])!),
    );
  }

  @override
  $ButtonsTable createAlias(String alias) {
    return $ButtonsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $converteractionData =
      const JsonConverter();
}

class Button extends DataClass implements Insertable<Button> {
  final int id;
  final String label;
  final int? color;
  final String? icon;
  final String? image;
  final bool isVisible;
  final String actionType;
  final Map<String, dynamic> actionData;
  const Button(
      {required this.id,
      required this.label,
      this.color,
      this.icon,
      this.image,
      required this.isVisible,
      required this.actionType,
      required this.actionData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['is_visible'] = Variable<bool>(isVisible);
    map['action_type'] = Variable<String>(actionType);
    {
      map['action_data'] = Variable<String>(
          $ButtonsTable.$converteractionData.toSql(actionData));
    }
    return map;
  }

  ButtonsCompanion toCompanion(bool nullToAbsent) {
    return ButtonsCompanion(
      id: Value(id),
      label: Value(label),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      isVisible: Value(isVisible),
      actionType: Value(actionType),
      actionData: Value(actionData),
    );
  }

  factory Button.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Button(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      color: serializer.fromJson<int?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
      image: serializer.fromJson<String?>(json['image']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
      actionType: serializer.fromJson<String>(json['actionType']),
      actionData: serializer.fromJson<Map<String, dynamic>>(json['actionData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'color': serializer.toJson<int?>(color),
      'icon': serializer.toJson<String?>(icon),
      'image': serializer.toJson<String?>(image),
      'isVisible': serializer.toJson<bool>(isVisible),
      'actionType': serializer.toJson<String>(actionType),
      'actionData': serializer.toJson<Map<String, dynamic>>(actionData),
    };
  }

  Button copyWith(
          {int? id,
          String? label,
          Value<int?> color = const Value.absent(),
          Value<String?> icon = const Value.absent(),
          Value<String?> image = const Value.absent(),
          bool? isVisible,
          String? actionType,
          Map<String, dynamic>? actionData}) =>
      Button(
        id: id ?? this.id,
        label: label ?? this.label,
        color: color.present ? color.value : this.color,
        icon: icon.present ? icon.value : this.icon,
        image: image.present ? image.value : this.image,
        isVisible: isVisible ?? this.isVisible,
        actionType: actionType ?? this.actionType,
        actionData: actionData ?? this.actionData,
      );
  @override
  String toString() {
    return (StringBuffer('Button(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('image: $image, ')
          ..write('isVisible: $isVisible, ')
          ..write('actionType: $actionType, ')
          ..write('actionData: $actionData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, label, color, icon, image, isVisible, actionType, actionData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Button &&
          other.id == this.id &&
          other.label == this.label &&
          other.color == this.color &&
          other.icon == this.icon &&
          other.image == this.image &&
          other.isVisible == this.isVisible &&
          other.actionType == this.actionType &&
          other.actionData == this.actionData);
}

class ButtonsCompanion extends UpdateCompanion<Button> {
  final Value<int> id;
  final Value<String> label;
  final Value<int?> color;
  final Value<String?> icon;
  final Value<String?> image;
  final Value<bool> isVisible;
  final Value<String> actionType;
  final Value<Map<String, dynamic>> actionData;
  const ButtonsCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.image = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.actionType = const Value.absent(),
    this.actionData = const Value.absent(),
  });
  ButtonsCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.image = const Value.absent(),
    this.isVisible = const Value.absent(),
    required String actionType,
    required Map<String, dynamic> actionData,
  })  : label = Value(label),
        actionType = Value(actionType),
        actionData = Value(actionData);
  static Insertable<Button> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<int>? color,
    Expression<String>? icon,
    Expression<String>? image,
    Expression<bool>? isVisible,
    Expression<String>? actionType,
    Expression<String>? actionData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (color != null) 'color': color,
      if (icon != null) 'icon': icon,
      if (image != null) 'image': image,
      if (isVisible != null) 'is_visible': isVisible,
      if (actionType != null) 'action_type': actionType,
      if (actionData != null) 'action_data': actionData,
    });
  }

  ButtonsCompanion copyWith(
      {Value<int>? id,
      Value<String>? label,
      Value<int?>? color,
      Value<String?>? icon,
      Value<String?>? image,
      Value<bool>? isVisible,
      Value<String>? actionType,
      Value<Map<String, dynamic>>? actionData}) {
    return ButtonsCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      isVisible: isVisible ?? this.isVisible,
      actionType: actionType ?? this.actionType,
      actionData: actionData ?? this.actionData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (actionData.present) {
      map['action_data'] = Variable<String>(
          $ButtonsTable.$converteractionData.toSql(actionData.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ButtonsCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('image: $image, ')
          ..write('isVisible: $isVisible, ')
          ..write('actionType: $actionType, ')
          ..write('actionData: $actionData')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isVisibleMeta =
      const VerificationMeta('isVisible');
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
      'is_visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_visible" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, type, isVisible];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'templates';
  @override
  VerificationContext validateIntegrity(Insertable<Template> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Template(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      isVisible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_visible'])!,
    );
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(attachedDatabase, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final String name;
  final String type;
  final bool isVisible;
  const Template(
      {required this.id,
      required this.name,
      required this.type,
      required this.isVisible});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['is_visible'] = Variable<bool>(isVisible);
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      isVisible: Value(isVisible),
    );
  }

  factory Template.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'isVisible': serializer.toJson<bool>(isVisible),
    };
  }

  Template copyWith({int? id, String? name, String? type, bool? isVisible}) =>
      Template(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        isVisible: isVisible ?? this.isVisible,
      );
  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isVisible: $isVisible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, isVisible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Template &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.isVisible == this.isVisible);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<bool> isVisible;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.isVisible = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.isVisible = const Value.absent(),
  })  : name = Value(name),
        type = Value(type);
  static Insertable<Template> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<bool>? isVisible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (isVisible != null) 'is_visible': isVisible,
    });
  }

  TemplatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<bool>? isVisible}) {
    return TemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isVisible: $isVisible')
          ..write(')'))
        .toString();
  }
}

class $ButtonPositionsTable extends ButtonPositions
    with TableInfo<$ButtonPositionsTable, ButtonPosition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ButtonPositionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _buttonIdMeta =
      const VerificationMeta('buttonId');
  @override
  late final GeneratedColumn<int> buttonId = GeneratedColumn<int>(
      'button_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES buttons (id)'));
  static const VerificationMeta _positionIdMeta =
      const VerificationMeta('positionId');
  @override
  late final GeneratedColumn<int> positionId = GeneratedColumn<int>(
      'position_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<int> templateId = GeneratedColumn<int>(
      'template_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES templates (id)'));
  @override
  List<GeneratedColumn> get $columns => [buttonId, positionId, templateId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'button_positions';
  @override
  VerificationContext validateIntegrity(Insertable<ButtonPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('button_id')) {
      context.handle(_buttonIdMeta,
          buttonId.isAcceptableOrUnknown(data['button_id']!, _buttonIdMeta));
    } else if (isInserting) {
      context.missing(_buttonIdMeta);
    }
    if (data.containsKey('position_id')) {
      context.handle(
          _positionIdMeta,
          positionId.isAcceptableOrUnknown(
              data['position_id']!, _positionIdMeta));
    } else if (isInserting) {
      context.missing(_positionIdMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ButtonPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ButtonPosition(
      buttonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}button_id'])!,
      positionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position_id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}template_id'])!,
    );
  }

  @override
  $ButtonPositionsTable createAlias(String alias) {
    return $ButtonPositionsTable(attachedDatabase, alias);
  }
}

class ButtonPosition extends DataClass implements Insertable<ButtonPosition> {
  final int buttonId;
  final int positionId;
  final int templateId;
  const ButtonPosition(
      {required this.buttonId,
      required this.positionId,
      required this.templateId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['button_id'] = Variable<int>(buttonId);
    map['position_id'] = Variable<int>(positionId);
    map['template_id'] = Variable<int>(templateId);
    return map;
  }

  ButtonPositionsCompanion toCompanion(bool nullToAbsent) {
    return ButtonPositionsCompanion(
      buttonId: Value(buttonId),
      positionId: Value(positionId),
      templateId: Value(templateId),
    );
  }

  factory ButtonPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ButtonPosition(
      buttonId: serializer.fromJson<int>(json['buttonId']),
      positionId: serializer.fromJson<int>(json['positionId']),
      templateId: serializer.fromJson<int>(json['templateId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'buttonId': serializer.toJson<int>(buttonId),
      'positionId': serializer.toJson<int>(positionId),
      'templateId': serializer.toJson<int>(templateId),
    };
  }

  ButtonPosition copyWith({int? buttonId, int? positionId, int? templateId}) =>
      ButtonPosition(
        buttonId: buttonId ?? this.buttonId,
        positionId: positionId ?? this.positionId,
        templateId: templateId ?? this.templateId,
      );
  @override
  String toString() {
    return (StringBuffer('ButtonPosition(')
          ..write('buttonId: $buttonId, ')
          ..write('positionId: $positionId, ')
          ..write('templateId: $templateId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(buttonId, positionId, templateId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ButtonPosition &&
          other.buttonId == this.buttonId &&
          other.positionId == this.positionId &&
          other.templateId == this.templateId);
}

class ButtonPositionsCompanion extends UpdateCompanion<ButtonPosition> {
  final Value<int> buttonId;
  final Value<int> positionId;
  final Value<int> templateId;
  final Value<int> rowid;
  const ButtonPositionsCompanion({
    this.buttonId = const Value.absent(),
    this.positionId = const Value.absent(),
    this.templateId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ButtonPositionsCompanion.insert({
    required int buttonId,
    required int positionId,
    required int templateId,
    this.rowid = const Value.absent(),
  })  : buttonId = Value(buttonId),
        positionId = Value(positionId),
        templateId = Value(templateId);
  static Insertable<ButtonPosition> custom({
    Expression<int>? buttonId,
    Expression<int>? positionId,
    Expression<int>? templateId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (buttonId != null) 'button_id': buttonId,
      if (positionId != null) 'position_id': positionId,
      if (templateId != null) 'template_id': templateId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ButtonPositionsCompanion copyWith(
      {Value<int>? buttonId,
      Value<int>? positionId,
      Value<int>? templateId,
      Value<int>? rowid}) {
    return ButtonPositionsCompanion(
      buttonId: buttonId ?? this.buttonId,
      positionId: positionId ?? this.positionId,
      templateId: templateId ?? this.templateId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (buttonId.present) {
      map['button_id'] = Variable<int>(buttonId.value);
    }
    if (positionId.present) {
      map['position_id'] = Variable<int>(positionId.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<int>(templateId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ButtonPositionsCompanion(')
          ..write('buttonId: $buttonId, ')
          ..write('positionId: $positionId, ')
          ..write('templateId: $templateId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IPsTable extends IPs with TableInfo<$IPsTable, IP> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IPsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isWindowsMeta =
      const VerificationMeta('isWindows');
  @override
  late final GeneratedColumn<bool> isWindows = GeneratedColumn<bool>(
      'is_windows', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_windows" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, name, address, isWindows];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'i_ps';
  @override
  VerificationContext validateIntegrity(Insertable<IP> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('is_windows')) {
      context.handle(_isWindowsMeta,
          isWindows.isAcceptableOrUnknown(data['is_windows']!, _isWindowsMeta));
    } else if (isInserting) {
      context.missing(_isWindowsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IP map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IP(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      isWindows: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_windows'])!,
    );
  }

  @override
  $IPsTable createAlias(String alias) {
    return $IPsTable(attachedDatabase, alias);
  }
}

class IP extends DataClass implements Insertable<IP> {
  final int id;
  final String name;
  final String address;
  final bool isWindows;
  const IP(
      {required this.id,
      required this.name,
      required this.address,
      required this.isWindows});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['is_windows'] = Variable<bool>(isWindows);
    return map;
  }

  IPsCompanion toCompanion(bool nullToAbsent) {
    return IPsCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      isWindows: Value(isWindows),
    );
  }

  factory IP.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IP(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      isWindows: serializer.fromJson<bool>(json['isWindows']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'isWindows': serializer.toJson<bool>(isWindows),
    };
  }

  IP copyWith({int? id, String? name, String? address, bool? isWindows}) => IP(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        isWindows: isWindows ?? this.isWindows,
      );
  @override
  String toString() {
    return (StringBuffer('IP(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('isWindows: $isWindows')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, isWindows);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IP &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.isWindows == this.isWindows);
}

class IPsCompanion extends UpdateCompanion<IP> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<bool> isWindows;
  const IPsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.isWindows = const Value.absent(),
  });
  IPsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    required bool isWindows,
  })  : name = Value(name),
        address = Value(address),
        isWindows = Value(isWindows);
  static Insertable<IP> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<bool>? isWindows,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (isWindows != null) 'is_windows': isWindows,
    });
  }

  IPsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? address,
      Value<bool>? isWindows}) {
    return IPsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      isWindows: isWindows ?? this.isWindows,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (isWindows.present) {
      map['is_windows'] = Variable<bool>(isWindows.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IPsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('isWindows: $isWindows')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ButtonsTable buttons = $ButtonsTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  late final $ButtonPositionsTable buttonPositions =
      $ButtonPositionsTable(this);
  late final $IPsTable iPs = $IPsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [buttons, templates, buttonPositions, iPs];
}
