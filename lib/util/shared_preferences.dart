import 'dart:convert';

import 'package:Wordy/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class WordyPreference {
  static setString(String key, String value) async {
    final prefes = await SharedPreferences.getInstance();
    prefes.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final prefes = await SharedPreferences.getInstance();
    if (prefes.containsKey(key)) {
      return prefes.get(key);
    }
    return '';
  }

//  static Future<List<Word>> fetchListAsString(String categoryName) async {
//
//    print('key ${categoryName}');
//
//    try {
////      final preferences = await SharedPreferences.getInstance();
////      print('contains key: ${preferences.containsKey(categoryName)}');
////
////      if (!preferences.containsKey(categoryName)) {
////        String dataString = preferences.getString(categoryName);
////
//////        print(dataString);
//////        List<Word> list = parseWords(dataString);
////        return dataString.toString();
////      } else {
////        print('erorr exception');
////        throw Exception('Error');
////      }
//
//    var data = getString(categoryName);
//    List<Word> list = parseWords(data.toString());
//    return list;
//
//    } catch (e) {
//      throw Exception(e.toString());
//    }
//  }

  static List<Word> parseWords(String dataString) {
    final parsed = json.decode(dataString).cast<Map<String, dynamic>>();
    return parsed.map<Word>((json) => Word.fromJson(json)).toList();
  }


//
//    final prefes = await SharedPreferences.getInstance();
//    List<Word> list = [];
//
//    if (!prefes.containsKey(categoryName)){
//      return list; //if this type category not exists in shared preference, return empty list
//    }
//
//    var storedData = prefes.get(categoryName);
//    var data = json.decode(storedData);
//
//
//    for (var word in data){
//      var stringId = '${word['id']}';
//      int id = int.parse(stringId);
//      list.add(new Word(id, '${word['word']}', '${word['meaning']}',
//          '${word['fillInTheGapSentence']}'));
//    }
//
//    print('in service ${list.length}');
//
//    return list;

//  }


}
