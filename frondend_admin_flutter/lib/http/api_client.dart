import 'dart:async';
// import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'api_const.dart';
import 'fhttp_client.dart';
// import 'package:luxup/config/model/address_data.dart';
// import 'package:luxup/config/model/coupon_data.dart';
// import 'package:luxup/config/model/rating_data.dart';
// import 'package:luxup/config/user_config.dart';
// import 'package:luxup/http/api_const.dart';
// import 'package:luxup/http/api_exception.dart';
// import 'package:luxup/http/fhttp_client.dart';
// import 'package:luxup/model/dictionary/app_tab.dart';
// import 'package:luxup/model/dictionary/article_tag.dart';
// import 'package:luxup/model/dictionary/comment_problem_tab.dart';
// import 'package:luxup/model/dictionary/dictionary.dart';
// import 'package:luxup/model/dictionary/home_news.dart';
// import 'package:luxup/model/dictionary/shape_tag.dart';
// import 'package:luxup/model/user.dart';
// import 'package:luxup/page/home/model/blog_article.dart';
// import 'package:luxup/page/home/model/carousel_data.dart';
// import 'package:luxup/page/about_us/model/fetch_about_us.dart';
// import 'package:luxup/page/product/model/product.dart';
// import 'package:luxup/page/suggestion/model/filter_items.dart';
// import 'package:luxup/page/suggestion/model/suggestion.dart';
// import 'package:luxup/util/fcm_util.dart';
// import 'package:luxup/util/print_log_util.dart';
// import 'package:luxup/util/regex_util.dart';
// import 'package:luxup/util/toast_util.dart';
// import '../config/model/file_data.dart';
// import '../page/comment_problem/model/FAQ_list_data.dart';
// import '../page/member_center/data/order_data.dart';
// import '../page/member_center/data/vip_question_type_data.dart';
// import '../page/privacy_policy/privacy_policy_data.dart';
// import '../page/suggestion/model/suggestionDetailData.dart';
// import '../page/suggestion/model/suggestionList.dart';

class ApiClient {
  static Future<List<String>> getMessages({CancelToken? cancelToken}) async {
    var completer = Completer<List<String>>();
    FHttpClient().get(ApiConst.getMessages, cancelToken: cancelToken).then((result) {
      // 假设 `result` 直接是一个字符串数组
      List<String> dataList;
      if (result != null && result is List) {
        // 直接从结果中映射字符串，不需要转换
        dataList = List<String>.from(result.map((x) => x as String));
      } else {
        // 如果结果为空或不是列表，返回一个空列表
        dataList = [];
      }
      completer.complete(dataList);
    }).catchError((err) => completer.completeError(err));
    return await completer.future;
  }
  //
  // static Future<List<HomeNews>> homeGetLastNews({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<HomeNews>>();
  //   FHttpClient().get(ApiConst.homeGetLastNews, cancelToken: cancelToken).then((result) {
  //     List<Dictionary> dataList = List<Dictionary>.from((result ?? []).map((x) => Dictionary.fromJson(x)));
  //     return completer.complete(dataList.whereType<HomeNews>().toList());
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<CarouselData>> homeGetHomeCarouselList({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<CarouselData>>();
  //   FHttpClient().get(
  //     ApiConst.homeGetHomeCarouselList,
  //     cancelToken: cancelToken,
  //     queryParameters: {'homeCarouselType': 12},
  //   ).then((result) {
  //     List<CarouselData> dataList = List<CarouselData>.from((result ?? []).map((x) => CarouselData.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<FetchAboutUs>> aboutUsGetAboutUsList({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<FetchAboutUs>>();
  //   FHttpClient().get(ApiConst.fetchAboutUs, cancelToken: cancelToken).then((result) {
  //     List<FetchAboutUs> dataList = List<FetchAboutUs>.from((result ?? []).map((x) => FetchAboutUs.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //
  //   return await completer.future;
  // }
  //
  // static Future<CarouselData?> homeGetHomeBanner({required HomeBannerType type, CancelToken? cancelToken}) async {
  //   var completer = Completer<CarouselData?>();
  //   FHttpClient().get(
  //     ApiConst.homeGetHomeBanner,
  //     cancelToken: cancelToken,
  //     queryParameters: {'homeCarouselType': type.type},
  //   ).then((result) {
  //     if (result == null) return completer.complete(null);
  //     CarouselData data = CarouselData.fromJson(result);
  //     return completer.complete(data);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<CommentProblemTab>> fetchCommentProblemByType({int type = 4, CancelToken? cancelToken}) async {
  //   var completer = Completer<List<CommentProblemTab>>();
  //   FHttpClient().get(
  //     ApiConst.commentProblemTagByType,
  //     cancelToken: cancelToken,
  //     queryParameters: {'type': type},
  //   ).then((result) {
  //     List<Dictionary> dataList = List<Dictionary>.from((result ?? []).map((x) => Dictionary.fromJson(x)));
  //     return completer.complete(dataList.whereType<CommentProblemTab>().toList());
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<BlogArticle>> homeGetLastArticle({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<BlogArticle>>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.homeGetLastArticle,
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     List<BlogArticle> dataList = List<BlogArticle>.from((result ?? []).map((x) => BlogArticle.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<CommentProblemListData>> fetchCommentProblemListData(int dictionaryId, {CancelToken? cancelToken}) async {
  //   var completer = Completer<List<CommentProblemListData>>();
  //   FHttpClient().get(
  //     ApiConst.commentProblemListByTag,
  //     cancelToken: cancelToken,
  //     queryParameters: {'dictionaryId': dictionaryId},
  //   ).then((result) {
  //     List<CommentProblemListData> dataList = List<CommentProblemListData>.from((result ?? []).map((x) => CommentProblemListData.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<ArticleTag>> getArticleTags({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<ArticleTag>>();
  //   FHttpClient().get(ApiConst.getArticleTags, cancelToken: cancelToken).then((result) {
  //     List<Dictionary> dataList = List<Dictionary>.from((result ?? []).map((x) => Dictionary.fromJson(x)));
  //     return completer.complete(dataList.whereType<ArticleTag>().toList());
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<BlogArticle>> getHotArticleList({CancelToken? cancelToken}) async {
  //   var completer = Completer<List<BlogArticle>>();
  //   FHttpClient().get(ApiConst.getHotArticleList, cancelToken: cancelToken).then((result) {
  //     List<BlogArticle> dataList = List<BlogArticle>.from((result ?? []).map((x) => BlogArticle.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<BlogArticle>> getArticleByType(
  //   int type,
  //   int offset,
  //   int limit, {
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<List<BlogArticle>>();
  //   FHttpClient().get(
  //     ApiConst.getBlogArticleByType,
  //     cancelToken: cancelToken,
  //     queryParameters: {'type': type, 'offset': offset, 'limit': limit},
  //   ).then((result) {
  //     List<BlogArticle> dataList = List<BlogArticle>.from((result ?? []).map((x) => BlogArticle.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<BlogArticle>> getBlogArticleByTagAndType(
  //   int type,
  //   int dictionaryId,
  //   int offset,
  //   int limit, {
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<List<BlogArticle>>();
  //   FHttpClient().get(
  //     ApiConst.getBlogArticleByTagAndType,
  //     cancelToken: cancelToken,
  //     queryParameters: {'type': type, 'dictionaryId': dictionaryId, 'offset': offset, 'limit': limit},
  //   ).then((result) {
  //     List<BlogArticle> dataList = List<BlogArticle>.from((result ?? []).map((x) => BlogArticle.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<BlogArticle> getArticle({required int blogArticleId, CancelToken? cancelToken}) async {
  //   var completer = Completer<BlogArticle>();
  //   FHttpClient().get(
  //     ApiConst.getArticle,
  //     cancelToken: cancelToken,
  //     queryParameters: {'blogArticleId': blogArticleId},
  //   ).then((result) {
  //     BlogArticle data = BlogArticle.fromJson(result);
  //     return completer.complete(data);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<PrivacyPolicyData>> getPrivacyPolicyData(
  //   int agreementType, {
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<List<PrivacyPolicyData>>();
  //   FHttpClient().get(
  //     ApiConst.getAgrementList,
  //     cancelToken: cancelToken,
  //     queryParameters: {'agreementType': agreementType},
  //   ).then((result) {
  //     List<PrivacyPolicyData> dataList = List<PrivacyPolicyData>.from((result ?? []).map((x) => PrivacyPolicyData.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Product>> productGetProductsList({
  //   int? dictionaryId,
  //   ProductsListSearchType? searchType,
  //   int? priceLow,
  //   int? priceHigh,
  //   String? keyWord,
  //   CancelToken? cancelToken,
  // }) async {
  //   assert((dictionaryId != null) || (searchType != null) || (keyWord != null));
  //   Map<String, dynamic> jsonMap = {};
  //   if (dictionaryId != null) jsonMap['dictionaryId'] = dictionaryId;
  //   if (searchType != null) jsonMap['searchType'] = searchType.typeNo;
  //   if ((priceLow ?? 0) > 0) jsonMap['priceLow'] = priceLow;
  //   if ((priceHigh ?? 0) > 0) jsonMap['priceHigh'] = priceHigh;
  //   if (keyWord?.isNotEmpty == true) jsonMap['keyWord'] = keyWord;
  //   var completer = Completer<List<Product>>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.productGetProductsList,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     List<Product> productList = ((result ?? []) as List).map((e) => Product.fromJson(e)).toList();
  //     return completer.complete(productList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<ShapTag>> productGetProductsShapeList({
  //   int? dictionaryId,
  //   ProductsListSearchType? searchType,
  //   CancelToken? cancelToken,
  // }) async {
  //   assert(!((dictionaryId == null) && (searchType == null)));
  //   Map<String, dynamic> jsonMap = {};
  //   if (dictionaryId != null) jsonMap['parentId'] = dictionaryId;
  //   if (searchType != null) jsonMap['searchType'] = searchType.typeNo;
  //   var completer = Completer<List<ShapTag>>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.productGetProductsShapeList,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     List<Dictionary> dataList = List<Dictionary>.from((result ?? []).map((x) => Dictionary.fromJson(x)));
  //     return completer.complete(dataList.whereType<ShapTag>().toList());
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<Product> productGetProduct({required int productId, CancelToken? cancelToken}) async {
  //   var completer = Completer<Product>();
  //   FHttpClient().get(
  //     ApiConst.productGetProduct,
  //     cancelToken: cancelToken,
  //     queryParameters: {'productId': productId},
  //   ).then((result) {
  //     Product data = Product.fromJson(result);
  //     return completer.complete(data);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Suggestion>> suggestionListByProductId({required int productId, CancelToken? cancelToken}) async {
  //   var completer = Completer<List<Suggestion>>();
  //   FHttpClient().get(
  //     ApiConst.getSuggestionListByProductId,
  //     cancelToken: cancelToken,
  //     queryParameters: {'productId': productId},
  //   ).then((result) {
  //     List<Suggestion> dataList = List<Suggestion>.from((result ?? []).map((x) => Suggestion.fromJson(x)));
  //     return completer.complete(dataList.whereType<Suggestion>().toList());
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<SuggestListData>> getSuggestionList({
  //   int? dictionaryId,
  //   required int page,
  //   required int size,
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<List<SuggestListData>>();
  //   if (dictionaryId == null) {
  //     FHttpClient().get(
  //       ApiConst.getSuggestionList,
  //       cancelToken: cancelToken,
  //       queryParameters: {'page': page, 'size': size},
  //     ).then((result) {
  //       if (result != null) {
  //         SuggestListData dataList = SuggestListData.fromJson(result);
  //         return completer.complete([dataList]);
  //       } else {
  //         completer.completeError('Received null result');
  //       }
  //     }).catchError((err) => completer.completeError(err));
  //   } else {
  //     FHttpClient().get(
  //       ApiConst.getSuggestionList,
  //       cancelToken: cancelToken,
  //       queryParameters: {'dictionaryId': dictionaryId, 'page': page, 'size': size},
  //     ).then((result) {
  //       if (result != null) {
  //         SuggestListData dataList = SuggestListData.fromJson(result);
  //         return completer.complete([dataList]);
  //       } else {
  //         completer.completeError('Received null result');
  //       }
  //     }).catchError((err) => completer.completeError(err));
  //   }
  //   return await completer.future;
  // }
  //
  // static Future<Suggestion> getSuggestionById({
  //   required int suggestionId,
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<Suggestion>();
  //   FHttpClient().get(
  //     ApiConst.getSuggestionById,
  //     cancelToken: cancelToken,
  //     queryParameters: {'suggestionId': suggestionId},
  //   ).then((result) {
  //     Suggestion dataList = Suggestion.fromJson(result);
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<FilterItem>> getSuggestionType(
  //   int dictionaryType, {
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<List<FilterItem>>();
  //   FHttpClient().get(
  //     ApiConst.getDictionaryTypeList,
  //     cancelToken: cancelToken,
  //     queryParameters: {'dictionaryType': dictionaryType},
  //   ).then((result) {
  //     if (result != null) {
  //       List<dynamic> dataList = result;
  //       List<FilterItem> typeLists = dataList.map((dataItem) {
  //         return FilterItem.fromJson(dataItem);
  //       }).toList();
  //       completer.complete(typeLists);
  //     } else {
  //       completer.completeError('Received null result or missing data field');
  //     }
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Product>> productGetSimilarProductsList({required int dictionaryId, int count = 99, CancelToken? cancelToken}) async {
  //   var completer = Completer<List<Product>>();
  //   FHttpClient().get(
  //     ApiConst.productGetSimilarProductsList,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'dictionaryId': dictionaryId,
  //       'count': count,
  //     },
  //   ).then((result) {
  //     List<Product> dataList = List<Product>.from((result ?? []).map((x) => Product.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> authSendVerificationCode({required String phoneNumber, CancelToken? cancelToken}) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.sendVerificationCode,
  //     cancelToken: cancelToken,
  //     queryParameters: phoneNumber,
  //   )
  //       .then((result) {
  //     ToastUtil.showText("已發送驗證碼");
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> sendEMailVerificationCode({required String email, CancelToken? cancelToken}) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.sendVerificationCode,
  //     cancelToken: cancelToken,
  //     queryParameters: email,
  //   )
  //       .then((result) {
  //     ToastUtil.showText("已發送驗證碼");
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> authSignUp({
  //   required String account,
  //   required String password,
  //   required String confirmPassword,
  //   required String verificationCode,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.signUp,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'account': account,
  //       'password': password,
  //       'confirmPassword': confirmPassword,
  //       'verificationCode': verificationCode,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> authforgetPw({
  //   required String account,
  //   required String password,
  //   required String confirmPassword,
  //   required String verificationCode,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.forgetPw,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'account': account,
  //       'password': password,
  //       'confirmPassword': confirmPassword,
  //       'verificationCode': verificationCode,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> thirdPartyLogin({
  //   required String loginThirdPartyId,
  //   required int loginType,
  //   required String name,
  //   required String? email,
  //   required String photoUrl,
  //   CancelToken? cancelToken,
  // }) async {
  //   Map<String, dynamic> jsonMap = {};
  //   jsonMap['loginThirdPartyId'] = loginThirdPartyId;
  //   jsonMap['loginType'] = loginType;
  //   jsonMap['name'] = name;
  //   jsonMap['photoUrl'] = photoUrl;
  //   if (email?.isNotEmpty == true) jsonMap['email'] = email;
  //   Completer completer = Completer<bool>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.thirdPartyLogin,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     UserConfig.instance.setAuthorizationToken(type: result['type'], token: result['token']);
  //     FcmUtil.getFCM();
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> authLogin({
  //   required String account,
  //   required String password,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.login,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'account': account,
  //       'password': password,
  //     },
  //   ).then((result) {
  //     if (result is Map) {
  //       UserConfig.instance.setAuthorizationToken(type: result['type'], token: result['token']);
  //       FcmUtil.getFCM();
  //       return completer.complete(true);
  //     } else if (result is ApiError) {
  //       BotToast.showText(text: result.message);
  //     } else {
  //       PrintLogUtil.printForDebug('Unknown result type: $result');
  //     }
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<User> userGetUserInfo({CancelToken? cancelToken}) async {
  //   Completer completer = Completer<User>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.userGetUserInfo,
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     User data = User.fromJson(result);
  //     return completer.complete(data);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> editUserPassword({
  //   required String oldPassword,
  //   required String newPassword,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.editUserPassword,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'oldPassword': oldPassword,
  //       'newPassword': newPassword,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> editUserPhoneNo({
  //   required String phoneNo,
  //   required String verificationCode,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.editUserPhoneNo,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'phoneNo': phoneNo,
  //       'verificationCode': verificationCode,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> editUserEMail({
  //   required String email,
  //   required String verificationCode,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.editUserEMail,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'email': email,
  //       'verificationCode': verificationCode,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> authUpdateFcmToken({
  //   required String fcmToken,
  //   CancelToken? cancelToken,
  // }) async {
  //   String? deviceId = UserConfig.instance.deviceId;
  //   if (deviceId?.isNotEmpty != true) return false;
  //   Completer completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.authUpdateFcmToken,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'deviceId': deviceId,
  //       'fcmToken': fcmToken,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<User> userEditUserInfo({Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
  //   Completer completer = Completer<User>();
  //   FHttpClient()
  //       .put(
  //     ApiConst.userEditUserInfo,
  //     queryParameters: queryParameters,
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     User data = User.fromJson(result);
  //     return completer.complete(data);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<int?> addFavorite({
  //   required TableType tableType,
  //   required int productId,
  //   int? userId,
  //   CancelToken? cancelToken,
  // }) async {
  //   Map<String, dynamic> jsonMap = {};
  //   jsonMap['tableType'] = tableType.typeNo;
  //   jsonMap['productId'] = productId;
  //   if (userId != null) jsonMap['userId'] = userId;
  //   Completer completer = Completer<int?>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.addFavorite,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     return completer.complete(result['favoriteId']);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<Address> addUserAddress({
  //   required Address addAddress,
  //   CancelToken? cancelToken,
  // }) async {
  //   Map<String, dynamic> jsonMap = addAddress.toJson();
  //   Completer completer = Completer<Address?>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.addUserAddress,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     return completer.complete(Address.fromJson(result));
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> addRating({
  //   required RatingData rating,
  //   CancelToken? cancelToken,
  // }) async {
  //   Map<String, dynamic> jsonMap = rating.toJson();
  //   Completer completer = Completer<bool>();
  //   FHttpClient()
  //       .postJSON(
  //     ApiConst.addRating,
  //     cancelToken: cancelToken,
  //     queryParameters: jsonMap,
  //   )
  //       .then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future deleteUserAddress({required int userAddressId, CancelToken? cancelToken}) async {
  //   FHttpClient().delete(
  //     ApiConst.deleteUserAddress,
  //     queryParameters: {
  //       'userAddressId': userAddressId,
  //     },
  //     cancelToken: cancelToken,
  //   );
  // }
  //
  // static Future<bool> deleteFavorite({required int favoriteId, CancelToken? cancelToken}) async {
  //   Completer completer = Completer<bool>();
  //   FHttpClient()
  //       .delete(
  //     ApiConst.deleteFavorite,
  //     queryParameters: {'favoriteId': favoriteId},
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     if (result is ApiError) return completer.complete(false);
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<OrderData>> getOrderList({CancelToken? cancelToken}) async {
  //   Completer completer = Completer<List<OrderData>>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.getOrderList,
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     if (result != null) {
  //       List<OrderData> orderData = List<OrderData>.from((result ?? []).map((x) => OrderData.fromJson(x)));
  //       return completer.complete(orderData);
  //     }
  //     List<OrderData> nullOrderData = <OrderData>[];
  //     return completer.complete(nullOrderData);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<String> createOrder({CancelToken? cancelToken, required List<OrderDetailAndImg> orderDetailList, required Order orders}) async {
  //   var completer = Completer<String>();
  //   FHttpClient().postJSON(
  //     ApiConst.createOrder,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'orders': orders.toJson(),
  //       'orderDetailList': orderDetailList.map((e) => e.toJson()).toList(),
  //     },
  //   ).then((result) {
  //     return completer.complete(result);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Address>> getUserAddressList({CancelToken? cancelToken}) async {
  //   Completer completer = Completer<List<Address>>();
  //   FHttpClient()
  //       .get(
  //     ApiConst.userAddressList,
  //     cancelToken: cancelToken,
  //   )
  //       .then((result) {
  //     if (result != null) {
  //       if (result == '資料庫沒有符合條件的資料') {
  //         return completer.complete(<Address>[]);
  //       }
  //       List<Address> addressData = List<Address>.from((result ?? []).map((x) => Address.fromJson(x)));
  //       return completer.complete(addressData);
  //     }
  //     List<Address> nullAddressData = <Address>[];
  //     return completer.complete(nullAddressData);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<SuggestDetailData>> getSuggestionFavoriteList({CancelToken? cancelToken}) async {
  //   Completer completer = Completer<List<SuggestDetailData>>();
  //   FHttpClient().get(ApiConst.getSuggestionFavoriteList, cancelToken: cancelToken).then((result) {
  //     List<SuggestDetailData> suggestionsList = ((result ?? []) as List).map((e) {
  //       e['suggestionsId'] = e['targetId'];
  //       e['imageUrlList'] = e['picList'];
  //       e['isFavorite'] = 1;
  //       return SuggestDetailData.fromJson(e);
  //     }).toList();
  //     return completer.complete(suggestionsList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Product>> getProductFavoriteList({CancelToken? cancelToken}) async {
  //   Completer completer = Completer<List<Product>>();
  //   FHttpClient().get(ApiConst.getProductFavoriteList, cancelToken: cancelToken).then((result) {
  //     List<Product> productList = ((result ?? []) as List).map((e) {
  //       e['productId'] = e['targetId'];
  //       e['productPicList'] = e['picList'];
  //       e['isFavorite'] = 1;
  //       return Product.fromJson(e);
  //     }).toList();
  //     return completer.complete(productList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<Coupon>> getCouponsList({List<int>? productIdList, CancelToken? cancelToken}) async {
  //   Map<String, dynamic> jsonMap = {};
  //   if (productIdList?.isNotEmpty == true) jsonMap['productIdArray'] = productIdList;
  //   Completer completer = Completer<List<Coupon>>();
  //   FHttpClient().get(ApiConst.getCouponsList, queryParameters: jsonMap, cancelToken: cancelToken).then((result) {
  //     List<Coupon> addressData = List<Coupon>.from((result ?? []).map((x) => Coupon.fromJson(x)));
  //     return completer.complete(addressData);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<bool> contactUsRecordUserRequire({
  //   required String email,
  //   required String contactText,
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<bool>();
  //   FHttpClient().postJSON(
  //     ApiConst.contactUsRecordUserRequire,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'email': email,
  //       'question': contactText,
  //     },
  //   ).then((result) {
  //     return completer.complete(true);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<String?> contactUsQueryMatchCannedMessage({
  //   required String contactText,
  //   CancelToken? cancelToken,
  // }) async {
  //   var completer = Completer<String?>();
  //   FHttpClient().get(
  //     ApiConst.contactUsQueryMatchCannedMessage,
  //     cancelToken: cancelToken,
  //     queryParameters: {'cannedMessageKey': contactText},
  //   ).then((result) {
  //     if (result == null) return completer.complete(null);
  //     String text = result['cannedMessageValue'] ?? '';
  //     return completer.complete(text.replaceAll(RegExp(RegexUtil.htmlTag), ''));
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<String> chooseStoreMap({
  //   required int storeType,
  //   required String device,
  //   required String page,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<String>();
  //   FHttpClient().postJSON(
  //     ApiConst.chooseStoreMap,
  //     cancelToken: cancelToken,
  //     queryParameters: {
  //       'storeType': storeType,
  //       'device': device,
  //       'page': page,
  //     },
  //   ).then((result) {
  //     return completer.complete(result);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<int?> fileUpload({
  //   required String fileType,
  //   required String filePath,
  //   CancelToken? cancelToken,
  // }) async {
  //   Completer completer = Completer<int?>();
  //   FHttpClient().postFile(
  //     ApiConst.fileUpload,
  //     cancelToken: cancelToken,
  //     queryParameter: {
  //       "fileType": fileType,
  //       "fileToUpload": await MultipartFile.fromFile(filePath, filename: filePath.split("/").last),
  //     },
  //   ).then((result) {
  //     return completer.complete(result);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<int?> sendVipMessage({
  //   required List<String> dataList,
  //   required String questionType,
  //   required String email,
  //   required String question,
  //   CancelToken? cancelToken,
  // }) async {
  //   List<MultipartFile> multipartFileList = [];
  //   for (String filePath in dataList) {
  //     MultipartFile multipartFile = await MultipartFile.fromFile(filePath, filename: filePath.split("/").last);
  //     multipartFileList.add(multipartFile);
  //   }
  //   Completer completer = Completer<int?>();
  //   FHttpClient().postFile(
  //     ApiConst.sendVipMessage,
  //     cancelToken: cancelToken,
  //     queryParameter: {
  //       "files": multipartFileList,
  //       "questionType": questionType,
  //       "email": email,
  //       "question": question,
  //     },
  //   ).then((result) {
  //     return completer.complete(result);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
  //
  // static Future<List<VIPQuestionType?>> getDictionaryList({required int type, CancelToken? cancelToken}) async {
  //   var completer = Completer<List<VIPQuestionType?>>();
  //   FHttpClient().get(
  //     ApiConst.getDictionaryList,
  //     cancelToken: cancelToken,
  //     queryParameters: {'type': type},
  //   ).then((result) {
  //     List<VIPQuestionType?> dataList = List<VIPQuestionType?>.from((result ?? []).map((x) => VIPQuestionType.fromJson(x)));
  //     return completer.complete(dataList);
  //   }).catchError((err) => completer.completeError(err));
  //   return await completer.future;
  // }
}

///**** homeGetHomeBanner *********
enum HomeBannerType {
  second(type: 22),
  third(type: 32);

  const HomeBannerType({required this.type});

  final int type;
}

///**** productGetProductsList *********
enum ProductsListSearchType {
  hot(typeNo: 1),
  latest(typeNo: 2),
  promotion(typeNo: 3),
  all(typeNo: 0);

  const ProductsListSearchType({required this.typeNo});

  final int typeNo;

  String get getTitle {
    switch (this) {
      case ProductsListSearchType.hot:
        return '熱銷單品';
      case ProductsListSearchType.latest:
        return '新品上架';
      case ProductsListSearchType.promotion:
        return '促銷商品';
      case ProductsListSearchType.all:
        return '';
    }
  }
}

///**** addFavorite *********
enum TableType {
  product,
  suggestion;

  int get typeNo {
    switch (this) {
      case TableType.product:
        return 1;
      case TableType.suggestion:
        return 2;
    }
  }
}
