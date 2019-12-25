import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flui/widgets/toast.dart';
import 'package:wanniu_app/data/api.dart';
import 'package:wanniu_app/data/config.dart';
import 'package:wanniu_app/utils/controller_service.dart';

class HttpService {
  /// get
  static Future get(
    String api, {
    Map<String, dynamic> params,
    String rootUrl = ROOT_URL,
    int connectTimeout = CONNECT_TIMEOUT,
    int receiveTimeout = RECEIVE_TIMEOUT,
    bool showSuccess = false,
    bool showLoading = false,
    bool showFail = true,
  }) async {
    // String token = await StorageService.get('token');
    Function dismiss;
    if (showLoading == true) {
      dismiss = FLToast.loading(text: 'Loading...');
    }
    BaseOptions options = new BaseOptions(
      baseUrl: rootUrl,
      queryParameters: params,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      contentType: ContentType.json,
    );
    // if (token != null) {
    //   options.headers = {
    //     'Authorization': 'Bearer ' + token,
    //   };
    // }
    Dio dio = new Dio(options);
    return dio.get(api).then((response) {
      if (showLoading == true) {
        dismiss();
      }
      if (showSuccess == true) {
        ControllerService.toastSuccess();
      }
      return response.data;
    }).catchError((error) {
      if (showLoading == true) {
        dismiss();
      }
      switch (error.type) {
        case DioErrorType.RESPONSE:
          Response response = error.response;
          switch (response.statusCode) {
            case 400:
              ControllerService.toastFail(response.data.toString());
              break;
            case 500:
              ControllerService.toastFail('Http status error [500]');
              break;
            default:
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          ControllerService.toastFail('请求超时');
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          ControllerService.toastFail('接收请求超时');
          break;
        default:
      }
    });
  }

  /// post
  static Future post(
    String api, {
    Map<String, dynamic> params,
    String rootUrl = ROOT_URL,
    int connectTimeout = CONNECT_TIMEOUT,
    int receiveTimeout = RECEIVE_TIMEOUT,
    bool showSuccess = true,
    bool showLoading = false,
    bool showFail = true,
  }) async {
    // String token = await StorageService.get('token');
    Function dismiss;
    if (showLoading == true) {
      dismiss = FLToast.loading(text: 'Loading...');
    }
    BaseOptions options = new BaseOptions(
      baseUrl: rootUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      contentType: ContentType.json,
    );
    // if (token != null) {
    //   options.headers = {
    //     'Authorization': 'Bearer ' + token,
    //   };
    // }
    Dio dio = new Dio(options);
    return dio.post(api, data: params).then((response) {
      if (showLoading == true) {
        dismiss();
      }
      if (showSuccess == true) {
        ControllerService.toastSuccess();
      }
      return response;
    }).catchError((error) {
      if (showLoading == true) {
        dismiss();
      }
      switch (error.type) {
        case DioErrorType.RESPONSE:
          Response response = error.response;
          switch (response.statusCode) {
            case 400:
              ControllerService.toastFail(response.data.toString());
              break;
            case 500:
              ControllerService.toastFail('Http status error [500]');
              break;
            default:
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          ControllerService.toastFail('请求超时');
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          ControllerService.toastFail('接收请求超时');
          break;
        default:
      }
      throw Exception(error);
    });
  }

  /// uploadImg
  static Future uploadImg(
    File image, {
    String api = COMMONAPI.upload_image,
    String rootUrl = ROOT_URL,
    int connectTimeout = CONNECT_TIMEOUT,
    int receiveTimeout = RECEIVE_TIMEOUT,
    bool showSuccess = false,
    bool showFail = true,
  }) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);

    FormData formData = new FormData.from({
      "image": new UploadFileInfo(new File(path), name,
          contentType: ContentType.parse("image/$suffix"))
    });

    // String token = await StorageService.get('token');

    BaseOptions options = new BaseOptions(
      baseUrl: rootUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    // if (token != null) {
    //   options.headers = {
    //     'Authorization': 'Bearer ' + token,
    //   };
    // }
    Dio dio = new Dio(options);

    return dio.post(api, data: formData).then((response) {
      final _res = response.data;
      if (_res['status'] == 1) {
        final _data = _res['data'] != null ? _res['data'] : _res;
        print('$api res ===> $_res');
        if (showSuccess == true) {
          ControllerService.toastSuccess();
        }
        return _data;
      } else {
        ControllerService.toastFail();
      }
    }).catchError((error) {
      print('$api err ===> $error');
      if (showFail == true) {
        ControllerService.toastFail(error.toString());
      }
      throw Exception(error);
    });
  }
}
