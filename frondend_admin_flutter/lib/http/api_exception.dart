class ApiError extends Error{
  final bool result;
  final String message;
  final String code;

  ApiError(this.result, this.message, this.code);

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        json['result'] as bool? ?? false,
        json['message'] as String? ?? '',
        json['code'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'result': result,
        'message': message,
        'code': code,
      };
  static const String tokenExpired = "999"; //需要登入 (token過期)
  static const String accountNotExist = "404 NOT_FOUND"; //"帳號不存在"(登入)
  static const String accountError = "902"; //帳號密碼錯誤 (登入)
  static const String noVerificationError = "911"; //未發送驗證碼 (註冊)
  static const String accountAlreadyExist = "901"; //帳號已存在 (註冊)
  static const String notSendVerificationCodeError = "驗證碼未發送!";//重設電話
  static const String wrongCode = "933"; //驗證碼不正確! (重設電話)
}

