import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 static late SharedPreferences pref;

static Future<void> intiShared() async {
    pref = await SharedPreferences.getInstance();
  }

 static Future<void> setBool({required String key, required bool bool}) async {
    await pref.setBool(key, bool);
  }

 static bool? getBool({required String key}) {
    return pref.getBool(key);
  }
}
