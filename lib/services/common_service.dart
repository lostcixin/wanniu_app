import 'package:wanniu_app/data/api.dart';
import 'package:wanniu_app/models/user_models.dart';
import 'package:wanniu_app/utils/http_service.dart';
import 'package:wanniu_app/utils/storage_service.dart';

class CommonService {
  /// 获取短信验证码
  static Future getCode(String phone) {
    Map<String, dynamic> params = {
      'mobile': phone,
    };
    return HttpService.post(COMMONAPI.sms, params: params, showSuccess: true)
        .then((res) async {
      return res;
    }).catchError((err) {});
  }

  static Future<UserRegisterModel> register(Map<String, dynamic> params) {
    return HttpService.post(USERAPI.register, params: params).then((res) async {
      UserRegisterModel data = UserRegisterModel.fromJson(res);
      StorageService.set('token', data.token, encrypt: true);
      print(data.token);
      return data;
    }).catchError((err) {});
  }
}
