import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:frondend_admin_flutter/config/user_config.dart';
import 'package:frondend_admin_flutter/constant.dart';
import 'package:frondend_admin_flutter/http/api_exception.dart';
// import 'package:frondend_admin_flutter/util/toast_util.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FHttpClient {
  static final FHttpClient _singleton = FHttpClient._internal();

  FHttpClient._internal();

  factory FHttpClient({BaseOptions? options}) {
    _singleton._dio = Dio(options ?? baseOptions);
    _singleton._dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // if (UserConfig.instance.authorizationToken?.isNotEmpty == true) {
          //   options.headers['Authorization'] = UserConfig.instance.authorizationToken;
          // }
          return handler.next(options);
        },
      ),
    );

    if (Environment.instance.type != EnvironmentType.prod) {
      _singleton._dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
    return _singleton;
  }

  late Dio _dio;
  final _cancelTokens = <String, CancelToken>{};

  static BaseOptions get baseOptions {
    return BaseOptions(
      baseUrl: '$domain',
      // baseUrl: '$domain$_basePath',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
      headers: {
        'Content-type': 'application/json',
        'Accept': '*/*',
      },
    );
  }

  static String get domain {
    // switch (Environment.instance.type) {
    //   case EnvironmentType.prod:
    //     return 'https://luxup.tw/';
    //   case EnvironmentType.stage:
    //     return 'https://luxup.tw/';
    //   case EnvironmentType.uat:
    //     return 'https://luxup.tw/';
    //   case EnvironmentType.dev:
    //     return 'https://luxup.tw/';
    // }
    return 'http://localhost:8080';
  }
  // return 'https://luxup.tw/';
  // return 'https://officepie.pro';

  static String get _basePath {
    return "";
    // switch (Environment.instance.type) {
    //   case EnvironmentType.prod:
    //     return '/LuxupService/app/';
    //   case EnvironmentType.stage:
    //     return '/LuxupService/app/';
    //   case EnvironmentType.uat:
    //     return '/LuxupService/app/';
    //   case EnvironmentType.dev:
    //     return '/LuxupService/app/';
    // }
  }

  ///*******************************
  CancelToken createCancelToken(String cancelTokenTag) {
    CancelToken cancelToken = _cancelTokens.containsKey(cancelTokenTag) ? _cancelTokens[cancelTokenTag]! : CancelToken();
    _cancelTokens[cancelTokenTag] = cancelToken;
    return cancelToken;
  }

  cancelCancelToken(String cancelTokenTag, {required String msg}) {
    _cancelTokens.remove(cancelTokenTag)?.cancel(msg);
  }

  ///*******************************
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      cancelToken ??= createCancelToken(url);
      Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      FormData? data;
      cancelToken ??= createCancelToken(url);
      if (queryParameters != null) data = FormData.fromMap(queryParameters);
      final response = await _dio.put(url, data: jsonEncode(queryParameters), options: Options(headers: {'Content-Type': 'application/json'}));
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      FormData? data;
      cancelToken ??= createCancelToken(url);
      if (queryParameters != null) data = FormData.fromMap(queryParameters);
      Response response = await _dio.post(url, data: data);
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postJSON(String url, {dynamic queryParameters, CancelToken? cancelToken}) async {
    try {
      String? json;
      cancelToken ??= createCancelToken(url);
      if (queryParameters is Map) json = jsonEncode(queryParameters);
      if (queryParameters is String) json = queryParameters;
      Response response = await _dio.post(url, data: json);
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK' || result['code'] == '200') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          if (e.response?.statusCode == 409) {
            var responseData = e.response?.data;
            if (responseData != null && responseData is Map) {
              var errorMessage = responseData['message'];
                // ToastUtil.showErrorText("$errorMessage");
            }
          }
        }
      }
      rethrow;
    }
  }

  Future<dynamic> postRawData(String url, {dynamic rawData, CancelToken? cancelToken}) async {
    try {
      cancelToken ??= createCancelToken(url);
      Response response = await _dio.post(url, data: rawData);
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postBinary(String url, {Uint8List? data, CancelToken? cancelToken}) async {
    try {
      Stream<List<int>>? stream;
      Map<String, dynamic>? headers;
      cancelToken ??= createCancelToken(url);
      if (data != null) {
        stream = Stream.fromIterable(data.map((e) => [e]));
        headers = {
          HttpHeaders.contentLengthHeader: data.length,
        };
      }
      Response response = await _dio.post(
        url,
        data: stream,
        options: Options(headers: headers),
      );
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postFile(String url, {required Map<String, dynamic> queryParameter, CancelToken? cancelToken}) async {
    try {
      FormData formData = FormData.fromMap(queryParameter);
      cancelToken ??= createCancelToken(url);
      Response response = await _dio.post(url, data: formData, cancelToken: cancelToken, options: Options(headers: {'Content-Type': 'multipart/form-data'}));
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 413) {
        // ToastUtil.showErrorText("上傳失敗，圖片大小過大!");
      } else {
        catchApiError(ApiError.fromJson(e.response?.data));
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String url, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      String? json;
      cancelToken ??= createCancelToken(url);
      if (queryParameters != null) json = jsonEncode(queryParameters);
      Response response = await _dio.patch(url, data: json);
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      FormData? data;
      cancelToken ??= createCancelToken(url);
      if (queryParameters != null) data = FormData.fromMap(queryParameters);
      Response response = await _dio.delete(url, data: data);
      _cancelTokens.remove(cancelToken);
      var result = response.data;
      if (result is Map) {
        if (result['result'] == true) {
          if (result['code'] == '0000' || result['code'] == '200 OK') {
            return result['data'];
          }
        }
      }
      throw ApiError.fromJson(result);
    } on ApiError catch (e) {
      catchApiError(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  void catchApiError(ApiError e) {
    String? errorText;
    if (e.code == ApiError.tokenExpired) {
      // UserConfig.instance.cleanUserTokenData();
      errorText = e.message; //需要登入 (token過期)
    } else if (e.code == ApiError.accountError) {
      errorText = e.message; //帳號密碼錯誤 (登入)
    } else if (e.code == ApiError.accountNotExist) {
      errorText = e.message; //"帳號不存在" (登入)
    } else if (e.code == ApiError.accountAlreadyExist) {
      errorText = e.message; //"帳號已註冊 "(註冊)
    } else if (e.code == ApiError.notSendVerificationCodeError) {
      errorText = e.code; //帳號密碼錯誤 (登入)
    } else if (e.code == ApiError.wrongCode) {
      errorText = e.message; //驗證碼不正確 (重設電話)
    }
    errorText ??= "發生異常，請聯絡技術人員";
    // ToastUtil.showErrorText(errorText);
  }
}
