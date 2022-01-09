// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'service/DrugDetails.dart';
import 'service/amblance_list_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1556127318209255729),
      name: 'DrugDetails',
      lastPropertyId: const IdUid(20, 8631762449074587602),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 804652318069590141),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 73103194295207232),
            name: 'administration',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8380093539676886018),
            name: 'adultDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1267713454327741489),
            name: 'brandName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5032524884938236743),
            name: 'childDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4715346383135088),
            name: 'contraindications',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3943295332605462196),
            name: 'drugId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1392658414135158367),
            name: 'generic',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 983541610522543292),
            name: 'indications',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 560845714837588565),
            name: 'interaction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 1378580137145175905),
            name: 'modeOfAction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 1190950524734435955),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 3733560651677659107),
            name: 'packSize',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 5410671503293192221),
            name: 'packSizeAndPrice',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 8028324299028995691),
            name: 'precautionsAndWarnings',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 6090095202934121058),
            name: 'pregnancyAndLactation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 439769327078746071),
            name: 'renalDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 7236549779930707917),
            name: 'sideEffects',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 5514199296130523779),
            name: 'therapeuticClass',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 8631762449074587602),
            name: 'type',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 4392137358345076181),
      name: 'ListOfAmbulance',
      lastPropertyId: const IdUid(14, 9188051782285619166),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4766596159232598838),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8441618211021493160),
            name: 'uuid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1006632810834420329),
            name: 'createdBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8211172744428091311),
            name: 'createdAt',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2906804198992963104),
            name: 'updatedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8182131647914257666),
            name: 'updatedAt',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2108335063995417857),
            name: 'driverName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 583657565611803595),
            name: 'phoneNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 5092020830277401753),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 7395638391612445759),
            name: 'division',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 3815732452954764293),
            name: 'district',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 8614692403761302436),
            name: 'upazila',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 3892637857044981621),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 9188051782285619166),
            name: 'isApproved',
            type: 1,
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
      lastEntityId: const IdUid(2, 4392137358345076181),
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
        }),
    ListOfAmbulance: EntityDefinition<ListOfAmbulance>(
        model: _entities[1],
        toOneRelations: (ListOfAmbulance object) => [],
        toManyRelations: (ListOfAmbulance object) => {},
        getId: (ListOfAmbulance object) => object.id,
        setId: (ListOfAmbulance object, int id) {
          object.id = id;
        },
        objectToFB: (ListOfAmbulance object, fb.Builder fbb) {
          final uuidOffset =
              object.uuid == null ? null : fbb.writeString(object.uuid);
          final createdByOffset = object.createdBy == null
              ? null
              : fbb.writeString(object.createdBy);
          final updatedByOffset = object.updatedBy == null
              ? null
              : fbb.writeString(object.updatedBy);
          final driverNameOffset = object.driverName == null
              ? null
              : fbb.writeString(object.driverName);
          final phoneNoOffset =
              object.phoneNo == null ? null : fbb.writeString(object.phoneNo);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title);
          final divisionOffset =
              object.division == null ? null : fbb.writeString(object.division);
          final districtOffset =
              object.district == null ? null : fbb.writeString(object.district);
          final upazilaOffset =
              object.upazila == null ? null : fbb.writeString(object.upazila);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address);
          fbb.startTable(15);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, uuidOffset);
          fbb.addOffset(2, createdByOffset);
          fbb.addInt64(3, object.createdAt);
          fbb.addOffset(4, updatedByOffset);
          fbb.addInt64(5, object.updatedAt);
          fbb.addOffset(6, driverNameOffset);
          fbb.addOffset(7, phoneNoOffset);
          fbb.addOffset(8, titleOffset);
          fbb.addOffset(9, divisionOffset);
          fbb.addOffset(10, districtOffset);
          fbb.addOffset(11, upazilaOffset);
          fbb.addOffset(12, addressOffset);
          fbb.addBool(13, object.isApproved);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ListOfAmbulance(
              uuid: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              createdBy: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              createdAt: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              updatedBy: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              updatedAt: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              driverName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              phoneNo: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              title: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              division: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              district: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 24),
              upazila: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              address:
                  const fb.StringReader().vTableGetNullable(buffer, rootOffset, 28),
              isApproved: const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 30))
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

/// [ListOfAmbulance] entity fields to define ObjectBox queries.
class ListOfAmbulance_ {
  /// see [ListOfAmbulance.id]
  static final id =
      QueryIntegerProperty<ListOfAmbulance>(_entities[1].properties[0]);

  /// see [ListOfAmbulance.uuid]
  static final uuid =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[1]);

  /// see [ListOfAmbulance.createdBy]
  static final createdBy =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[2]);

  /// see [ListOfAmbulance.createdAt]
  static final createdAt =
      QueryIntegerProperty<ListOfAmbulance>(_entities[1].properties[3]);

  /// see [ListOfAmbulance.updatedBy]
  static final updatedBy =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[4]);

  /// see [ListOfAmbulance.updatedAt]
  static final updatedAt =
      QueryIntegerProperty<ListOfAmbulance>(_entities[1].properties[5]);

  /// see [ListOfAmbulance.driverName]
  static final driverName =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[6]);

  /// see [ListOfAmbulance.phoneNo]
  static final phoneNo =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[7]);

  /// see [ListOfAmbulance.title]
  static final title =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[8]);

  /// see [ListOfAmbulance.division]
  static final division =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[9]);

  /// see [ListOfAmbulance.district]
  static final district =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[10]);

  /// see [ListOfAmbulance.upazila]
  static final upazila =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[11]);

  /// see [ListOfAmbulance.address]
  static final address =
      QueryStringProperty<ListOfAmbulance>(_entities[1].properties[12]);

  /// see [ListOfAmbulance.isApproved]
  static final isApproved =
      QueryBooleanProperty<ListOfAmbulance>(_entities[1].properties[13]);
}
