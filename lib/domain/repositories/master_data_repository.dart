import 'package:epms_tech/domain/model/harvesting_method.dart';
import 'package:epms_tech/domain/model/employee.dart';

abstract class MasterDataRepository { // INTERFACE
  Future<void> saveHarvestMethods(List<HarvestingMethod> harvestingMethods); // SIMPAN HIVE DAN PARSED JSON
  Future<List<HarvestingMethod>> getHarvestMethods(); // AKAN RETURN SUKSES ATAU GAGAL

  Future<void> saveEmployee(List<Employee> employee);
  Future<List<Employee>> getEmployee();
}