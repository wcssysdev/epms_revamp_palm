import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/division.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/domain/entities/estate.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
import 'package:epms_tech/domain/entities/work_center.dart';
import 'package:epms_tech/domain/entities/work_type.dart';
// import 'package:epms_tech/domain/model/harvesting_method_model.dart';

abstract class MasterDataRepository { // INTERFACE
  Future<void> saveHarvestMethods(List<HarvestingMethod> harvestingMethods);
  Future<List<HarvestingMethod>> getHarvestMethods();

  Future<void> saveEmployee(List<Employee> employee);// Employee = dari Entities JANGAN HAPUS
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

}