import 'package:flutter/material.dart';
import 'package:need_doctors/view/drug_details/utils/items.dart';

itemsDrugDetials(drugModelList) {
  return Column(
    children: [
      drugInfoList(
        drugModelList.indications,
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
        drugModelList.contraindications,
        'Contraindications',
      ),
      drugInfoList(
        drugModelList.sideEffects,
        'SideEffects',
      ),
      drugInfoList(
        drugModelList.precautionsAndWarnings,
        'Precautions And Warnings',
      ),
      drugInfoList(
        drugModelList.pregnancyAndLactation,
        'Pregnancy And Lactation',
      ),
      drugInfoList(
        drugModelList.therapeuticClass,
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
        drugModelList.packSizeAndPrice,
        'Pack Size And Price',
      ),
    ],
  );
}
