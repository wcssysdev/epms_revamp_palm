import 'package:epms_tech/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class AuthLocalDatasource {
  // Future<void> saveSchemas(Map<String, dynamic> parsedData) async {
  //   await compute(_saveSchemasBackground, parsedData);
  //   print('Background saveSchemas selesai');
  // }

  Future<void> saveSchemas(Map<String, dynamic> parsedData) async {
    var box = await Hive.openBox('epms_data');

    final mVraDocumentSchema = AppConstants.mVraDocumentSchema;
    final mVraTypeSchema = AppConstants.mVraTypeSchema;
    final mUomSchema = AppConstants.mUomSchema;
    final mNpMaterialSchema = AppConstants.mNpMaterialSchema;
    final rolesSchema = AppConstants.rolesSchema;

    final userRoles = parsedData['global'][rolesSchema][0]['user_roles'];
    print('$userRoles');
    final schemaKeys = [
      rolesSchema,
      AppConstants.mConfigSchema,
      AppConstants.mAttendanceSchema,
      AppConstants.mEstateSchema,
      AppConstants.mDivisionSchema,
      AppConstants.mBlockSchema,
      AppConstants.mTphSchema,
      AppConstants.mEmployeeSchema,
      AppConstants.tUserAssignmentSchema,
      AppConstants.mcOphCardSchema,
      AppConstants.mcSpbCardSchema,
      AppConstants.mActivitySchema,
      AppConstants.mMaterialSchema,
      AppConstants.mDestinationSchema,
      AppConstants.mVraSchema,
      AppConstants.mVendorSchema,
      AppConstants.mHarvestingMethodSchema,
      AppConstants.mWorkTypeSchema,
      AppConstants.mWorkCenterSchema,
      AppConstants.mConfirmationTextSchema
    ];

    for (final key in schemaKeys) {
      try {
        final value = parsedData['global'][key];
        await box.put(key, value); // simpan satu-satu, biar stabil
        print('global schma done: $key');
      } catch (e) {
        print('Error save in $key = $e');
      }
    }

    if(parsedData['global'][mVraDocumentSchema] != null) {
      await box.put(mVraDocumentSchema, parsedData['global'][mVraDocumentSchema]);
    }
    if(parsedData['global'][mVraTypeSchema] != null) {
      await box.put(mVraTypeSchema, parsedData['global'][mVraTypeSchema]);
    }
    if(parsedData['global'][mUomSchema] != null) {
      await box.put(mUomSchema, parsedData['global'][mUomSchema]);
    }
    if(parsedData['global'][mNpMaterialSchema].length > 0) {
      await box.put(mNpMaterialSchema, parsedData['global'][mNpMaterialSchema]);
    }

    if (userRoles  == 'harvest_clerk') {
      print('Harvest Clerk run ');

      final harvesterSchemaKeys = [
        AppConstants.laporanRestanSchema,
        AppConstants.laporanPanenKemarinSchema,
        AppConstants.laporanPanenKemarinPersonsSchema,
        AppConstants.tHarvestingPlanSchema,
        AppConstants.tAbwSchema
      ];

      /* OPSI
      await Future.wait(harvesterSchemaKeys.map((key) async {
        try {
          final value = parsedData['harvest_clerk'][key];
          await box.put(key, value);
          print('Harvest clerk done');
        } catch (e) {
          print('Error save in $key = $e');
        }
      }));
      */

      for (final key in harvesterSchemaKeys) {
        try {
          final value = parsedData['harvest_clerk'][key];
          await box.put(key, value); // simpan satu-satu, biar stabil
          print('Harvest clerk done: $key');
        } catch (e) {
          print('Error save in $key = $e');
        }
      }
    }

    if (userRoles == 'transport_clerk') {
      print('Transport Clerk run ');

      final transporterSchemaKeys = [
        AppConstants.laporanRestanSchema,
        AppConstants.laporanSpbKemarinSchema,
        AppConstants.laporanSpbKemarinOphSchema,
        AppConstants.laporanPanenKemarinPersonsSchema,
        AppConstants.mBinSchema,
        AppConstants.mVendorVehicleSchema
      ];

      // await Future.wait(transporterSchemaKeys.map((key) async { // OPSI
      //   try {
      //     final value = parsedData['transport_clerk'][key];
      //     await box.put(key, value);
      //     print('transport clerk done');

      //   } catch (e) {
      //     print('Error save in $key = $e');
      //   }
      // }));

      for (final key in transporterSchemaKeys) {
        try {
          final value = parsedData['transport_clerk'][key];
          await box.put(key, value); // simpan satu-satu, biar stabil
          print('TRANSPORT clerk done: $key');
        } catch (e) {
          print('Error save in $key = $e');
        }
      }
    }

    if (userRoles == 'field_staff') {
      print('field staff store run ');

      final fieldStaffSchemaKeys = [
        AppConstants.tWorkplanSchema,
        AppConstants.mWbsSchema,
        AppConstants.tHarvestingPlanSchema
      ];

      // await Future.wait(fieldStaffSchemaKeys.map((key) async { // OPSI
      //   try {
      //     final value = parsedData['field_staff'][key];
      //     await box.put(key, value);
      //     print('field staff done = ');
      //   } catch (e) {
      //     print('Error save in $key = $e');
      //   }
      // }));

      for (final key in fieldStaffSchemaKeys) {
        try {
          final value = parsedData['field_staff'][key];
          await box.put(key, value); // simpan satu-satu, biar stabil
          print('FIELD STAFF clerk done: $key');
        } catch (e) {
          print('Error save in $key = $e');
        }
      }
    }
  } 

  Future<dynamic> getData(String schemaName) async {
    var box = await Hive.openBox('epms_data');
    return box.get(schemaName);
  }
}
