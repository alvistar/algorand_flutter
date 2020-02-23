import 'package:shared_preferences/shared_preferences.dart';

class Configuration {
  SharedPreferences prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get key {
    return prefs.getString('prova');
  }

 set key (value ){
    prefs.setString('prova', 'myprova');
  }
}