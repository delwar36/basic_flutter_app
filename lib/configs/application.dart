import 'package:basic_app/models/model.dart';
import 'package:basic_app/utils/utils.dart';

class Application {
  static const bool debug = false;
  static const String version = '1.1.2';
  static const String domain = 'http://listar.passionui.com/index.php/wp-json';
  static const String googleAPI = 'AIzaSyAGHlk0PoZ-BdSwUJh_HGSHXWKlARE4Pt8';
  static DeviceModel? device;

  static Future<void> setDevice() async {
    device = await UtilOther.getDeviceInfo();
  }

  static Future<void> setDeviceToken() async {
    device!.token = await UtilOther.getDeviceToken();
  }

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
