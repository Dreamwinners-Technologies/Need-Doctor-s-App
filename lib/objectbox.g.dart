// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'service/DrugDetails.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7089902353707619330),
      name: 'DrugDetails',
      lastPropertyId: const IdUid(20, 7811708622262218265),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2375805566478161171),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 875295716954016096),
            name: 'administration',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8144399077685190352),
            name: 'adultDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4330638766942029767),
            name: 'brandName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1571737609244374848),
            name: 'childDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3416178154687989418),
            name: 'contraindications',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8538239785821617559),
            name: 'drugId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3454870416821969880),
            name: 'generic',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3640296713017479432),
            name: 'indications',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 1398897663987956853),
            name: 'interaction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 5296074213511730785),
            name: 'modeOfAction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 718420639943145154),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 9022653822912934062),
            name: 'packSize',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 6535062725977680858),
            name: 'packSizeAndPrice',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 58538471086678316),
            name: 'precautionsAndWarnings',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 7979670726085235551),
            name: 'pregnancyAndLactation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 8179994305673503631),
            name: 'renalDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 2970510599330177938),
            name: 'sideEffects',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 1873882638312233487),
            name: 'therapeuticClass',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 7811708622262218265),
            name: 'type',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String directory,
        int maxDBSizeInKB,
        int fileMode,
        int maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7089902353707619330),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    DrugDetails: EntityDefinition<DrugDetails>(
        model: _entities[0],
        toOneRelations: (DrugDetails object) => [],
        toManyRelations: (DrugDetails object) => {},
        getId: (DrugDetails object) => object.id,
        setId: (DrugDetails object, int id) {
          object.id = id;
        },
        objectToFB: (DrugDetails object, fb.Builder fbb) {
          final administrationOffset = object.administration == null
              ? null
              : fbb.writeString(object.administration);
          final adultDoseOffset = object.adultDose == null
              ? null
              : fbb.writeString(object.adultDose);
          final brandNameOffset = object.brandName == null
              ? null
              : fbb.writeString(object.brandName);
          final childDoseOffset = object.childDose == null
              ? null
              : fbb.writeString(object.childDose);
          final contraindicationsOffset = object.contraindications == null
              ? null
              : fbb.writeString(object.contraindications);
          final drugIdOffset =
              object.drugId == null ? null : fbb.writeString(object.drugId);
          final genericOffset =
              object.generic == null ? null : fbb.writeString(object.generic);
          final indicationsOffset = object.indications == null
              ? null
              : fbb.writeString(object.indications);
          final interactionOffset = object.interaction == null
              ? null
              : fbb.writeString(object.interaction);
          final modeOfActionOffset = object.modeOfAction == null
              ? null
              : fbb.writeString(object.modeOfAction);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name);
          final packSizeOffset =
              object.packSize == null ? null : fbb.writeString(object.packSize);
          final packSizeAndPriceOffset = object.packSizeAndPrice == null
              ? null
              : fbb.writeString(object.packSizeAndPrice);
          final precautionsAndWarningsOffset =
              object.precautionsAndWarnings == null
                  ? null
                  : fbb.writeString(object.precautionsAndWarnings);
          final pregnancyAndLactationOffset =
              object.pregnancyAndLactation == null
                  ? null
                  : fbb.writeString(object.pregnancyAndLactation);
          final renalDoseOffset = object.renalDose == null
              ? null
              : fbb.writeString(object.renalDose);
          final sideEffectsOffset = object.sideEffects == null
              ? null
              : fbb.writeString(object.sideEffects);
          final therapeuticClassOffset = object.therapeuticClass == null
              ? null
              : fbb.writeString(object.therapeuticClass);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type);
          fbb.startTable(21);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, administrationOffset);
          fbb.addOffset(2, adultDoseOffset);
          fbb.addOffset(3, brandNameOffset);
          fbb.addOffset(4, childDoseOffset);
          fbb.addOffset(5, contraindicationsOffset);
          fbb.addOffset(6, drugIdOffset);
          fbb.addOffset(7, genericOffset);
          fbb.addOffset(8, indicationsOffset);
          fbb.addOffset(9, interactionOffset);
          fbb.addOffset(10, modeOfActionOffset);
          fbb.addOffset(11, nameOffset);
          fbb.addOffset(12, packSizeOffset);
          fbb.addOffset(13, packSizeAndPriceOffset);
          fbb.addOffset(14, precautionsAndWarningsOffset);
          fbb.addOffset(15, pregnancyAndLactationOffset);
          fbb.addOffset(16, renalDoseOffset);
          fbb.addOffset(17, sideEffectsOffset);
          fbb.addOffset(18, therapeuticClassOffset);
          fbb.addOffset(19, typeOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DrugDetails(
              administration: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              adultDose: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              brandName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              childDose: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              contraindications: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              drugId: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              generic: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              indications: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              interaction: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              modeOfAction: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 24),
              name: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              packSize: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 28),
              packSizeAndPrice: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 30),
              precautionsAndWarnings: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 32),
              pregnancyAndLactation: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 34),
              renalDose: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 36),
              sideEffects: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 38),
              therapeuticClass: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 40),
              type: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 42))
            ..id = const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [DrugDetails] entity fields to define ObjectBox queries.
class DrugDetails_ {
  /// see [DrugDetails.id]
  static final id =
      QueryIntegerProperty<DrugDetails>(_entities[0].properties[0]);

  /// see [DrugDetails.administration]
  static final administration =
      QueryStringProperty<DrugDetails>(_entities[0].properties[1]);

  /// see [DrugDetails.adultDose]
  static final adultDose =
      QueryStringProperty<DrugDetails>(_entities[0].properties[2]);

  /// see [DrugDetails.brandName]
  static final brandName =
      QueryStringProperty<DrugDetails>(_entities[0].properties[3]);

  /// see [DrugDetails.childDose]
  static final childDose =
      QueryStringProperty<DrugDetails>(_entities[0].properties[4]);

  /// see [DrugDetails.contraindications]
  static final contraindications =
      QueryStringProperty<DrugDetails>(_entities[0].properties[5]);

  /// see [DrugDetails.drugId]
  static final drugId =
      QueryStringProperty<DrugDetails>(_entities[0].properties[6]);

  /// see [DrugDetails.generic]
  static final generic =
      QueryStringProperty<DrugDetails>(_entities[0].properties[7]);

  /// see [DrugDetails.indications]
  static final indications =
      QueryStringProperty<DrugDetails>(_entities[0].properties[8]);

  /// see [DrugDetails.interaction]
  static final interaction =
      QueryStringProperty<DrugDetails>(_entities[0].properties[9]);

  /// see [DrugDetails.modeOfAction]
  static final modeOfAction =
      QueryStringProperty<DrugDetails>(_entities[0].properties[10]);

  /// see [DrugDetails.name]
  static final name =
      QueryStringProperty<DrugDetails>(_entities[0].properties[11]);

  /// see [DrugDetails.packSize]
  static final packSize =
      QueryStringProperty<DrugDetails>(_entities[0].properties[12]);

  /// see [DrugDetails.packSizeAndPrice]
  static final packSizeAndPrice =
      QueryStringProperty<DrugDetails>(_entities[0].properties[13]);

  /// see [DrugDetails.precautionsAndWarnings]
  static final precautionsAndWarnings =
      QueryStringProperty<DrugDetails>(_entities[0].properties[14]);

  /// see [DrugDetails.pregnancyAndLactation]
  static final pregnancyAndLactation =
      QueryStringProperty<DrugDetails>(_entities[0].properties[15]);

  /// see [DrugDetails.renalDose]
  static final renalDose =
      QueryStringProperty<DrugDetails>(_entities[0].properties[16]);

  /// see [DrugDetails.sideEffects]
  static final sideEffects =
      QueryStringProperty<DrugDetails>(_entities[0].properties[17]);

  /// see [DrugDetails.therapeuticClass]
  static final therapeuticClass =
      QueryStringProperty<DrugDetails>(_entities[0].properties[18]);

  /// see [DrugDetails.type]
  static final type =
      QueryStringProperty<DrugDetails>(_entities[0].properties[19]);
}
