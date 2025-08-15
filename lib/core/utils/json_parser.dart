import 'dart:convert';
import 'package:flutter/foundation.dart';

Map<String, dynamic> _parseAndDecode(String response) {
  // _ artinya nama function yg private/tidak bisa diakses dari file lain
  // response di dapat dari API = response.body
  return jsonDecode(response);
  /*
    mengubah string JSON -> struktur data DARt
    Map didefenisikan karena data JSON adalah string = "{.....}""
    String jsonStr = "{"name":"Dika", "age": 30}"
    var resulr = jsonDecode(jsonStr);
    print(result['name']); // "Dika"

    Function yang akan return Map<String, dynamic>
   */
}

Future<Map<String, dynamic>> parseJsonInBackground(String jsonStr) async {
  // Future<Map<String, dynamic>> = fungsi asynchronous
  // Map<String, dynamic> = return data dari fungsi ini
  // jsonStr = data mentah API res data
  return await compute(_parseAndDecode, jsonStr);
  // compute = menjalankan fungsi isolate (thread terpisah) agar UI tidak freeze
}