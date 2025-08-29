import 'package:hive/hive.dart';

enum HiveMethod {get, delete, clear }

Future<dynamic> onHiveGetDeleteHandler(HiveMethod method, String keyName) async {
  var box = await Hive.openBox('epms_data');
  /*
  [] = artinya bersifat opsional
  dynamic = artinya data bebas String, Int, Map, List, dll
   */

  switch (method) {
    case HiveMethod.get:
      await box.get(keyName);
      return true;
    case HiveMethod.delete:
      await box.delete(keyName);
      return true;
    case HiveMethod.clear:
      await box.clear();
      return true;
  }
}

Future<dynamic> onHivePut(String keyName, dynamic data) async { // JANGAN DIPASANG SAAT RESPON LOGIN - PERFORMANCE ISSUE
  var box = await Hive.openBox('epms_data');
  await box.put(keyName, data);
}