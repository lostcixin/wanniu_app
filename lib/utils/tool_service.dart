import 'package:encrypt/encrypt.dart';

class ToolService {
  /// 加密/解密 配置
  static Map<String, dynamic> encryptConfig() {
    final key = Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    return {'iv': iv, 'encrypter': encrypter};
  }

  /// 加密
  static String encrypt(String content) {
    final config = encryptConfig();
    final iv = config['iv'];
    final encrypter = config['encrypter'];
    final encrypted = encrypter.encrypt(content, iv: iv);
    return encrypted.base64;
  }

  /// 解密
  static String decrypt(String encrypted) {
    final config = encryptConfig();
    final iv = config['iv'];
    final encrypter = config['encrypter'];
    return encrypter.decrypt64(encrypted, iv: iv);
  }
}
