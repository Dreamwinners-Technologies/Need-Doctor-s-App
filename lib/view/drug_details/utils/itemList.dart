import 'package:flutter/material.dart';
import 'package:need_doctors/models/DrugDBModel.dart';
import 'package:need_doctors/view/drug_details/utils/items.dart';

itemsDrugDetials(DrugDbModel drugModelList) {
  return Column(
    children: [
      drugInfoList(
        drugModelList.indication,
        'Indications',
      ),
      drugInfoList(
        drugModelList.adultDose,
        'Adult Dose',
      ),
      drugInfoList(
        drugModelList.childDose,
        'Child Dose',
      ),
      drugInfoList(
        drugModelList.renalDose,
        'Renal Dose',
      ),
      drugInfoList(
        drugModelList.administration,
        'Administration',
      ),
      drugInfoList(
        drugModelList.contraIndication,
        'Contraindications',
      ),
      drugInfoList(
        drugModelList.sideEffect,
        'SideEffects',
      ),
      drugInfoList(
        drugModelList.precaution,
        'Precautions And Warnings',
      ),
      drugInfoList(
        drugModelList.pregnancyCategoryNote,
        'Pregnancy And Lactation',
      ),
      drugInfoList(
        "",
        'Therapeutic Class',
      ),
      drugInfoList(
        drugModelList.modeOfAction,
        'Mode Of Action',
      ),
      drugInfoList(
        drugModelList.interaction,
        'Interaction',
      ),
      drugInfoList(
        "Pack Size: "+drugModelList.packsize+"\n"+"Price: "+drugModelList.price,
        'Pack Size And Price',
      ),
    ],
  );
}
