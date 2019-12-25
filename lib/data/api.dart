import 'package:wanniu_app/data/config.dart';

/// 测试服/正式服 http
const String ROOT_URL =
    DEBUG ? 'http://120.24.247.206/' : 'http://120.24.247.206/';

class COMMONAPI {
  static const upload_image = '/api/common/upload_image'; //上传图片
  static const sms = 'codes/'; //发送验证码
}

class USERAPI {
  static const register = 'users/'; //用户注册
}
