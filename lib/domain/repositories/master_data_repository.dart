import 'package:epms_tech/domain/entities/activity.dart';
import 'package:epms_tech/domain/entities/attendance.dart';
import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/destination.dart';
import 'package:epms_tech/domain/entities/division.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/domain/entities/estate.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
import 'package:epms_tech/domain/entities/master_block.dart';
import 'package:epms_tech/domain/entities/material_schema.dart';
import 'package:epms_tech/domain/entities/receiving_point.dart';
import 'package:epms_tech/domain/entities/user_assignment.dart';
import 'package:epms_tech/domain/entities/vendor.dart';
import 'package:epms_tech/domain/entities/vra.dart';
import 'package:epms_tech/domain/entities/vra_type.dart';
import 'package:epms_tech/domain/entities/work_center.dart';
import 'package:epms_tech/domain/entities/work_type.dart';
// import 'package:epms_tech/domain/model/harvesting_method_model.dart';

abstract class MasterDataRepository {
  // INTERFACE
  Future<void> saveHarvestMethods(List<HarvestingMethod> harvestingMethods);
  Future<List<HarvestingMethod>> getHarvestMethods();

  Future<void> saveEmployee(
    List<Employee> employee,
  ); // Employee = dari Entities JANGAN HAPUS
  Future<List<Employee>> getEmployee();

  // M_Crop_type_Schema
  Future<void> saveCropType(List<CropType> cropType);
  Future<List<CropType>> getCropType();

  Future<void> saveWorkType(List<WorkType> workType);
  Future<List<WorkType>> getWorkType();

  Future<void> saveWorkCenter(List<WorkCenter> workCenter);
  Future<List<WorkCenter>> getWorkCenter();

  Future<void> saveEstate(List<Estate> workCenter);
  Future<List<Estate>> getEstate();

  Future<void> saveDivision(List<Division> workCenter);
  Future<List<Division>> getDivision();

  Future<void> saveMasterBlock(List<MasterBlock> workCenter);
  Future<List<MasterBlock>> getMasterBlock();

  Future<void> saveVendor(List<Vendor> workCenter);
  Future<List<Vendor>> getVendor();

  Future<void> saveAcitvity(List<Activity> workCenter);
  Future<List<Activity>> getActivity();

  Future<void> saveAttendance(List<Attendance> workCenter);
  Future<List<Attendance>> getAttendance();

  Future<void> saveVra(List<Vra> vra);
  Future<List<Vra>> getVra();

  Future<void> saveVraType(List<VraType> vraType);
  Future<List<VraType>> getVraType();

  Future<void> saveReceivingPoint(List<RecevingPoint> receivingPoints);
  Future<List<RecevingPoint>> getReceivingPoint();

  Future<void> saveDestination(List<Destination> destinations);
  Future<List<Destination>> getDestination();

  Future<void> saveMaterial(List<MaterialSchema> materials);
  Future<List<MaterialSchema>> getMaterial();

  Future<void> saveUserAssignment(List<UserAssignment> userAssignments);
  Future<List<UserAssignment>> getUserAssignment();
}
