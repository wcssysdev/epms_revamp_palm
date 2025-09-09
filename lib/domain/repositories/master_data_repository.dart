import 'package:epms_tech/domain/entities/crop_type.dart';
import 'package:epms_tech/domain/entities/employee.dart';
import 'package:epms_tech/domain/entities/harvesting_method.dart';
// import 'package:epms_tech/domain/model/harvesting_method_model.dart';

abstract class MasterDataRepository { // INTERFACE
  Future<void> saveHarvestMethods(List<HarvestingMethod> harvestingMethods);
  Future<List<HarvestingMethod>> getHarvestMethods();

  Future<void> saveEmployee(List<Employee> employee);// Employee = dari Entities JANGAN HAPUS
  Future<List<Employee>> getEmployee();

  // M_Crop_type_Schema
  Future<void> saveCropType(List<CropType> cropType);
  Future<List<CropType>> getCropType();
  
}