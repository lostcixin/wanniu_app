import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanniu_app/utils/tool_service.dart';

class StorageService {
  /// 存储数据
  /// 缓存时间单位为 分钟
  static Future<bool> set(
    String key,
    dynamic value, {
    bool encrypt = false,
    int cacheTime,
  }) async {
    DateTime overTime;
    if (cacheTime != null) {
      DateTime now = new DateTime.now();
      overTime = now.add(new Duration(minutes: cacheTime));
    }

    if (encrypt == true) {
      value = ToolService.encrypt(json.encode(value));
    }

    var data = {
      'value': value,
      'encrypt': encrypt, // 是否加密
      'cacheTime': cacheTime, // 缓存时长
      'overTime': overTime.toString(), // 缓存到期时间
    };

    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(data));
  }

  /// 获得数据
  static Future get(String key) async {
    final prefs = await SharedPreferences.getInstance();

    var data = prefs.get(key);
    if (data == null) {
      return null;
    }
    data = json.decode(data);
    var value = data['value'];

    if (data['encrypt'] == true) {
      value = json.decode(ToolService.decrypt(value));
    }

    if (data['cacheTime'] != null) {
      DateTime now = new DateTime.now();
      DateTime overTime = DateTime.parse(data['overTime']);
      if (now.isAfter(overTime)) {
        return null;
      }
    }

    return value;
  }

  /// 删除数据
  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  /// 清空数据
  static Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
