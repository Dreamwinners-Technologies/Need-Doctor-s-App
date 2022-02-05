// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'service/DrugDetails.dart';
import 'service/list_of_ambulance.dart';
import 'service/visiting_card_list.dart';

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
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 9121198933384618759),
      name: 'ListOfAmbulance',
      lastPropertyId: const IdUid(14, 3537073080778060642),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2961703024896338046),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 212529901149050961),
            name: 'uuid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 294493707747347781),
            name: 'createdBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2398078308523212697),
            name: 'createdAt',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4802254041408977647),
            name: 'updatedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7391094988225851482),
            name: 'updatedAt',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4139478203136411941),
            name: 'driverName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1962987969872988792),
            name: 'phoneNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2101920259288059174),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 2193242469772593800),
            name: 'division',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 3462259937804947662),
            name: 'district',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 3872138172616855028),
            name: 'upazila',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 394369651355358643),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 3537073080778060642),
            name: 'isApproved',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 2339854863325525538),
      name: 'CardInfoResponseList',
      lastPropertyId: const IdUid(12, 600019712657765803),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4826984898146615381),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4499935780039233759),
            name: 'addedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3315751000142660092),
            name: 'appointmentNo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3672207130331884163),
            name: 'cardImageUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 222385330413557117),
            name: 'cardOcrData',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 665925818604563571),
            name: 'district',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6099398606224245243),
            name: 'cardid',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8419202965630389140),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3539690241961852631),
            name: 'specialization',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 3194650719791003824),
            name: 'thana',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 4831012075505225455),
            name: 'specializationString',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 600019712657765803),
            name: 'nameSearch',
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
      lastEntityId: const IdUid(3, 2339854863325525538),
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
        }),
    CardInfoResponseList: EntityDefinition<CardInfoResponseList>(
        model: _entities[2],
        toOneRelations: (CardInfoResponseList object) => [],
        toManyRelations: (CardInfoResponseList object) => {},
        getId: (CardInfoResponseList object) => object.id,
        setId: (CardInfoResponseList object, int id) {
          object.id = id;
        },
        objectToFB: (CardInfoResponseList object, fb.Builder fbb) {
          final addedByOffset =
              object.addedBy == null ? null : fbb.writeString(object.addedBy);
          final appointmentNoOffset = object.appointmentNo == null
              ? null
              : fbb.writeString(object.appointmentNo);
          final cardImageUrlOffset = object.cardImageUrl == null
              ? null
              : fbb.writeString(object.cardImageUrl);
          final cardOcrDataOffset = object.cardOcrData == null
              ? null
              : fbb.writeString(object.cardOcrData);
          final districtOffset =
              object.district == null ? null : fbb.writeString(object.district);
          final cardidOffset =
              object.cardid == null ? null : fbb.writeString(object.cardid);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name);
          final specializationOffset = object.specialization == null
              ? null
              : fbb.writeList(object.specialization
                  .map(fbb.writeString)
                  .toList(growable: false));
          final thanaOffset =
              object.thana == null ? null : fbb.writeString(object.thana);
          final specializationStringOffset = object.specializationString == null
              ? null
              : fbb.writeString(object.specializationString);
          final nameSearchOffset = object.nameSearch == null
              ? null
              : fbb.writeString(object.nameSearch);
          fbb.startTable(13);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, addedByOffset);
          fbb.addOffset(2, appointmentNoOffset);
          fbb.addOffset(3, cardImageUrlOffset);
          fbb.addOffset(4, cardOcrDataOffset);
          fbb.addOffset(5, districtOffset);
          fbb.addOffset(6, cardidOffset);
          fbb.addOffset(7, nameOffset);
          fbb.addOffset(8, specializationOffset);
          fbb.addOffset(9, thanaOffset);
          fbb.addOffset(10, specializationStringOffset);
          fbb.addOffset(11, nameSearchOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CardInfoResponseList(
              addedBy: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              appointmentNo: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              cardImageUrl: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              cardOcrData: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              district: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              cardid: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              name: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              nameSearch: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              specialization: const fb.ListReader<String>(fb.StringReader(), lazy: false)
                  .vTableGetNullable(buffer, rootOffset, 20),
              thana: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              specializationString:
                  const fb.StringReader().vTableGetNullable(buffer, rootOffset, 24))
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

/// [CardInfoResponseList] entity fields to define ObjectBox queries.
class CardInfoResponseList_ {
  /// see [CardInfoResponseList.id]
  static final id =
      QueryIntegerProperty<CardInfoResponseList>(_entities[2].properties[0]);

  /// see [CardInfoResponseList.addedBy]
  static final addedBy =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[1]);

  /// see [CardInfoResponseList.appointmentNo]
  static final appointmentNo =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[2]);

  /// see [CardInfoResponseList.cardImageUrl]
  static final cardImageUrl =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[3]);

  /// see [CardInfoResponseList.cardOcrData]
  static final cardOcrData =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[4]);

  /// see [CardInfoResponseList.district]
  static final district =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[5]);

  /// see [CardInfoResponseList.cardid]
  static final cardid =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[6]);

  /// see [CardInfoResponseList.name]
  static final name =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[7]);

  /// see [CardInfoResponseList.specialization]
  static final specialization = QueryStringVectorProperty<CardInfoResponseList>(
      _entities[2].properties[8]);

  /// see [CardInfoResponseList.thana]
  static final thana =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[9]);

  /// see [CardInfoResponseList.specializationString]
  static final specializationString =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[10]);

  /// see [CardInfoResponseList.nameSearch]
  static final nameSearch =
      QueryStringProperty<CardInfoResponseList>(_entities[2].properties[11]);
}
