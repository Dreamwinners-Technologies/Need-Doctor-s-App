// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'service/DrugDetails.dart';
import 'service/generics-offline-model.dart';
import 'service/list_of_ambulance.dart';
import 'service/medicine-offline-model.dart';
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
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 4317786063932820061),
      name: 'GenericsOfflineModel',
      lastPropertyId: const IdUid(16, 1919475765063390278),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1615941157367000825),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2089633028064504413),
            name: 'genericId',
            type: 6,
            flags: 8,
            indexId: const IdUid(1, 8009810295901814556)),
        ModelProperty(
            id: const IdUid(3, 6588014752691868561),
            name: 'genericName',
            type: 9,
            flags: 2048,
            indexId: const IdUid(5, 9011249409877981121)),
        ModelProperty(
            id: const IdUid(4, 1400004266813339871),
            name: 'precaution',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2526848113604098970),
            name: 'indication',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2662925850373978364),
            name: 'contraIndication',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4539826091438727342),
            name: 'dose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2806760968140805084),
            name: 'sideEffect',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 5700953921184151459),
            name: 'pregnanciesCategoryId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 8066183116587683505),
            name: 'modeOfAction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 35976654496666777),
            name: 'interaction',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 2069671090993576360),
            name: 'pregnancyCategoryNote',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 2128319703357765157),
            name: 'adultDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 5782442046652799714),
            name: 'childDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 8338564849003073076),
            name: 'renalDose',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 1919475765063390278),
            name: 'administration',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 826203476611459244),
      name: 'MedicineOfflineModel',
      lastPropertyId: const IdUid(10, 8137240313052675426),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 765543529057941205),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7329834907617618758),
            name: 'medicineId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5521787645197062886),
            name: 'brandName',
            type: 9,
            flags: 2048,
            indexId: const IdUid(4, 3869859240104146544)),
        ModelProperty(
            id: const IdUid(4, 2407083662864235858),
            name: 'genericName',
            type: 9,
            flags: 2048,
            indexId: const IdUid(2, 474085577582502686)),
        ModelProperty(
            id: const IdUid(5, 6498306661901238673),
            name: 'companyName',
            type: 9,
            flags: 2048,
            indexId: const IdUid(3, 7037532375031396524)),
        ModelProperty(
            id: const IdUid(6, 2946149973452285016),
            name: 'form',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1294971685922582026),
            name: 'strength',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 4869568807732055237),
            name: 'price',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 8234747322315371141),
            name: 'packedSize',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 8137240313052675426),
            name: 'genericId',
            type: 6,
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
      lastEntityId: const IdUid(5, 826203476611459244),
      lastIndexId: const IdUid(5, 9011249409877981121),
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
        }),
    GenericsOfflineModel: EntityDefinition<GenericsOfflineModel>(
        model: _entities[3],
        toOneRelations: (GenericsOfflineModel object) => [],
        toManyRelations: (GenericsOfflineModel object) => {},
        getId: (GenericsOfflineModel object) => object.id,
        setId: (GenericsOfflineModel object, int id) {
          object.id = id;
        },
        objectToFB: (GenericsOfflineModel object, fb.Builder fbb) {
          final genericNameOffset = object.genericName == null
              ? null
              : fbb.writeString(object.genericName);
          final precautionOffset = object.precaution == null
              ? null
              : fbb.writeString(object.precaution);
          final indicationOffset = object.indication == null
              ? null
              : fbb.writeString(object.indication);
          final contraIndicationOffset = object.contraIndication == null
              ? null
              : fbb.writeString(object.contraIndication);
          final doseOffset =
              object.dose == null ? null : fbb.writeString(object.dose);
          final sideEffectOffset = object.sideEffect == null
              ? null
              : fbb.writeString(object.sideEffect);
          final modeOfActionOffset = object.modeOfAction == null
              ? null
              : fbb.writeString(object.modeOfAction);
          final interactionOffset = object.interaction == null
              ? null
              : fbb.writeString(object.interaction);
          final pregnancyCategoryNoteOffset =
              object.pregnancyCategoryNote == null
                  ? null
                  : fbb.writeString(object.pregnancyCategoryNote);
          final adultDoseOffset = object.adultDose == null
              ? null
              : fbb.writeString(object.adultDose);
          final childDoseOffset = object.childDose == null
              ? null
              : fbb.writeString(object.childDose);
          final renalDoseOffset = object.renalDose == null
              ? null
              : fbb.writeString(object.renalDose);
          final administrationOffset = object.administration == null
              ? null
              : fbb.writeString(object.administration);
          fbb.startTable(17);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.genericId);
          fbb.addOffset(2, genericNameOffset);
          fbb.addOffset(3, precautionOffset);
          fbb.addOffset(4, indicationOffset);
          fbb.addOffset(5, contraIndicationOffset);
          fbb.addOffset(6, doseOffset);
          fbb.addOffset(7, sideEffectOffset);
          fbb.addInt64(8, object.pregnanciesCategoryId);
          fbb.addOffset(9, modeOfActionOffset);
          fbb.addOffset(10, interactionOffset);
          fbb.addOffset(11, pregnancyCategoryNoteOffset);
          fbb.addOffset(12, adultDoseOffset);
          fbb.addOffset(13, childDoseOffset);
          fbb.addOffset(14, renalDoseOffset);
          fbb.addOffset(15, administrationOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = GenericsOfflineModel(
              genericId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              genericName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              precaution: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              indication: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              contraIndication: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              dose: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              sideEffect: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              pregnanciesCategoryId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              modeOfAction: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              interaction: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 24),
              pregnancyCategoryNote: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              adultDose: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 28),
              childDose: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 30),
              renalDose: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 32),
              administration: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 34))
            ..id = const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

          return object;
        }),
    MedicineOfflineModel: EntityDefinition<MedicineOfflineModel>(
        model: _entities[4],
        toOneRelations: (MedicineOfflineModel object) => [],
        toManyRelations: (MedicineOfflineModel object) => {},
        getId: (MedicineOfflineModel object) => object.id,
        setId: (MedicineOfflineModel object, int id) {
          object.id = id;
        },
        objectToFB: (MedicineOfflineModel object, fb.Builder fbb) {
          final medicineIdOffset = object.medicineId == null
              ? null
              : fbb.writeString(object.medicineId);
          final brandNameOffset = object.brandName == null
              ? null
              : fbb.writeString(object.brandName);
          final genericNameOffset = object.genericName == null
              ? null
              : fbb.writeString(object.genericName);
          final companyNameOffset = object.companyName == null
              ? null
              : fbb.writeString(object.companyName);
          final formOffset =
              object.form == null ? null : fbb.writeString(object.form);
          final strengthOffset =
              object.strength == null ? null : fbb.writeString(object.strength);
          final priceOffset =
              object.price == null ? null : fbb.writeString(object.price);
          final packedSizeOffset = object.packedSize == null
              ? null
              : fbb.writeString(object.packedSize);
          fbb.startTable(11);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, medicineIdOffset);
          fbb.addOffset(2, brandNameOffset);
          fbb.addOffset(3, genericNameOffset);
          fbb.addOffset(4, companyNameOffset);
          fbb.addOffset(5, formOffset);
          fbb.addOffset(6, strengthOffset);
          fbb.addOffset(7, priceOffset);
          fbb.addOffset(8, packedSizeOffset);
          fbb.addInt64(9, object.genericId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MedicineOfflineModel(
              medicineId: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              brandName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              genericName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              companyName: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              form: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              strength: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              price: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              packedSize: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              genericId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 22))
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

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

/// [GenericsOfflineModel] entity fields to define ObjectBox queries.
class GenericsOfflineModel_ {
  /// see [GenericsOfflineModel.id]
  static final id =
      QueryIntegerProperty<GenericsOfflineModel>(_entities[3].properties[0]);

  /// see [GenericsOfflineModel.genericId]
  static final genericId =
      QueryIntegerProperty<GenericsOfflineModel>(_entities[3].properties[1]);

  /// see [GenericsOfflineModel.genericName]
  static final genericName =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[2]);

  /// see [GenericsOfflineModel.precaution]
  static final precaution =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[3]);

  /// see [GenericsOfflineModel.indication]
  static final indication =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[4]);

  /// see [GenericsOfflineModel.contraIndication]
  static final contraIndication =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[5]);

  /// see [GenericsOfflineModel.dose]
  static final dose =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[6]);

  /// see [GenericsOfflineModel.sideEffect]
  static final sideEffect =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[7]);

  /// see [GenericsOfflineModel.pregnanciesCategoryId]
  static final pregnanciesCategoryId =
      QueryIntegerProperty<GenericsOfflineModel>(_entities[3].properties[8]);

  /// see [GenericsOfflineModel.modeOfAction]
  static final modeOfAction =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[9]);

  /// see [GenericsOfflineModel.interaction]
  static final interaction =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[10]);

  /// see [GenericsOfflineModel.pregnancyCategoryNote]
  static final pregnancyCategoryNote =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[11]);

  /// see [GenericsOfflineModel.adultDose]
  static final adultDose =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[12]);

  /// see [GenericsOfflineModel.childDose]
  static final childDose =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[13]);

  /// see [GenericsOfflineModel.renalDose]
  static final renalDose =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[14]);

  /// see [GenericsOfflineModel.administration]
  static final administration =
      QueryStringProperty<GenericsOfflineModel>(_entities[3].properties[15]);
}

/// [MedicineOfflineModel] entity fields to define ObjectBox queries.
class MedicineOfflineModel_ {
  /// see [MedicineOfflineModel.id]
  static final id =
      QueryIntegerProperty<MedicineOfflineModel>(_entities[4].properties[0]);

  /// see [MedicineOfflineModel.medicineId]
  static final medicineId =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[1]);

  /// see [MedicineOfflineModel.brandName]
  static final brandName =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[2]);

  /// see [MedicineOfflineModel.genericName]
  static final genericName =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[3]);

  /// see [MedicineOfflineModel.companyName]
  static final companyName =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[4]);

  /// see [MedicineOfflineModel.form]
  static final form =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[5]);

  /// see [MedicineOfflineModel.strength]
  static final strength =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[6]);

  /// see [MedicineOfflineModel.price]
  static final price =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[7]);

  /// see [MedicineOfflineModel.packedSize]
  static final packedSize =
      QueryStringProperty<MedicineOfflineModel>(_entities[4].properties[8]);

  /// see [MedicineOfflineModel.genericId]
  static final genericId =
      QueryIntegerProperty<MedicineOfflineModel>(_entities[4].properties[9]);
}
