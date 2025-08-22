import 'package:hive/hive.dart';

enum HiveMethod {put, get, delete, clear }

Future<dynamic> onHiveHandler(HiveMethod method, String keyName, dynamic data) async {
  /*
  [] = artinya bersifat opsional
  dynamic = artinya data bebas String, Int, Map, List, dll
   */
  var box = await Hive.openBox('epms_data');

  switch (method) {
    case HiveMethod.put: 
      await box.put(keyName, data);
      return true;
    case HiveMethod.get:
      await box.get(keyName);
    case HiveMethod.delete:
      await box.delete(keyName);
      return true;
    case HiveMethod.clear:
      await box.clear();
      return true;
  }
}