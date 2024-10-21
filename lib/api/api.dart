import 'dart:async';

import '../api/http_manager.dart';
import '../models/model.dart';

class Api {
  ///URL API
  static const String login = "/jwt-auth/v1/token";
  static const String authValidate = "/jwt-auth/v1/token/validate";
  static const String user = "/v1/auth/user";
  static const String register = "/v1/auth/register";
  static const String forgotPassword = "/v1/auth/reset_password";
  static const String changePassword = "/wp/v2/users/me";
  static const String changeProfile = "/wp/v2/users/me";
  static const String setting = "/v1/setting/init";
  static const String submitSetting = "/v1/place/form";
  static const String home = "/v1/home/init";
  static const String categories = "/v1/category/list";
  static const String discovery = "/v1/category/list_discover";
  static const String withLists = "/v1/wishlist/list";
  static const String addWishList = "/v1/wishlist/save";
  static const String removeWishList = "/v1/wishlist/remove";
  static const String clearWithList = "/v1/wishlist/reset";
  static const String list = "/v1/place/list";
  static const String deleteProduct = "/v1/place/delete";
  static const String authorList = "/v1/author/listing";
  static const String authorReview = "/v1/author/comments";
  static const String tags = "/v1/place/terms";
  static const String comments = "/v1/comments";
  static const String saveComment = "/wp/v2/comments";
  static const String product = "/v1/place/view";
  static const String saveProduct = "/v1/place/save";
  static const String locations = "/v1/location/list";
  static const String uploadImage = "/wp/v2/media";

  ///Login api
  static Future<ResultApiModel> requestLogin(params) async {
    final result = await httpManager.post(url: login, data: params);
    return ResultApiModel.fromJson(result);
  }

  ///Validate token valid
  static Future<ResultApiModel> requestValidateToken() async {
    Map<String, dynamic> result = await httpManager.post(url: authValidate);
    result['success'] = result['code'] == 'jwt_auth_valid_token';
    result['message'] = result['code'] ?? result['message'];
    return ResultApiModel.fromJson(result);
  }

  ///Forgot password
  static Future<ResultApiModel> requestForgotPassword(params) async {
    Map<String, dynamic> result = await httpManager.post(
      url: forgotPassword,
      data: params,
    );
    result['message'] = result['code'] ?? result['msg'];
    return ResultApiModel.fromJson(result);
  }

  ///Register account
  static Future<ResultApiModel> requestRegister(params) async {
    final result = await httpManager.post(url: register, data: params);
    final convertResponse = {
      "success": result['code'] == 200,
      "message": result['message'],
      "data": result
    };
    return ResultApiModel.fromJson(convertResponse);
  }

  ///Change Profile
  static Future<ResultApiModel> requestChangeProfile(params) async {
    final result = await httpManager.post(url: changeProfile, data: params);
    final convertResponse = {
      "success": result['code'] == null,
      "message": result['code'] ?? "update_info_success",
      "data": result
    };
    return ResultApiModel.fromJson(convertResponse);
  }

  ///change password
  static Future<ResultApiModel> requestChangePassword(params) async {
    final result = await httpManager.post(url: changePassword, data: params);
    final convertResponse = {
      "success": result['code'] == null,
      "message": result['code'] ?? "change_password_success",
      "data": result
    };
    return ResultApiModel.fromJson(convertResponse);
  }

  ///Get User
  static Future<ResultApiModel> requestUser() async {
    final result = await httpManager.get(url: user);
    return ResultApiModel.fromJson(result);
  }

  ///Get Setting
  static Future<ResultApiModel> requestSetting() async {
    final result = await httpManager.get(url: setting);
    return ResultApiModel.fromJson(result);
  }

  ///Get Submit Setting
  static Future<ResultApiModel> requestSubmitSetting(params) async {
    final result = await httpManager.get(
      url: submitSetting,
      params: params,
    );
    final convertResponse = {
      "success": result['countries'] != null,
      "data": result
    };
    return ResultApiModel.fromJson(convertResponse);
  }

  ///Get Area
  static Future<ResultApiModel> requestLocation(params) async {
    final result = await httpManager.get(url: locations, params: params);
    return ResultApiModel.fromJson(result);
  }

  ///Get Category
  static Future<ResultApiModel> requestCategory() async {
    final result = await httpManager.get(url: categories);
    return ResultApiModel.fromJson(result);
  }

  ///Get Discovery
  static Future<ResultApiModel> requestDiscovery() async {
    final result = await httpManager.get(url: discovery);
    return ResultApiModel.fromJson(result);
  }

  ///Get Home
  static Future<ResultApiModel> requestHome() async {
    final result = await httpManager.get(url: home);
    return ResultApiModel.fromJson(result);
  }

  ///Get ProductDetail
  static Future<ResultApiModel> requestProduct(params) async {
    final result = await httpManager.get(
      url: product,
      params: params,
    );
    return ResultApiModel.fromJson(result);
  }

  ///Get Wish List
  static Future<ResultApiModel> requestWishList(params) async {
    final result = await httpManager.get(url: withLists, params: params);
    return ResultApiModel.fromJson(result);
  }

  ///Save Wish List
  static Future<ResultApiModel> requestAddWishList(params) async {
    final result = await httpManager.post(url: addWishList, data: params);
    return ResultApiModel.fromJson(result);
  }

  ///Save Product
  static Future<ResultApiModel> requestSaveProduct(params) async {
    final result = await httpManager.post(url: saveProduct, data: params);
    return ResultApiModel.fromJson(result);
  }

  ///Remove Wish List
  static Future<ResultApiModel> requestRemoveWishList(params) async {
    final result = await httpManager.post(url: removeWishList, data: params);
    return ResultApiModel.fromJson(result);
  }

  ///Clear Wish List
  static Future<ResultApiModel> requestClearWishList() async {
    final result = await httpManager.post(url: clearWithList);
    return ResultApiModel.fromJson(result);
  }

  ///Get Product List
  static Future<ResultApiModel> requestList(params) async {
    final result = await httpManager.get(url: list, params: params);
    return ResultApiModel.fromJson(result);
  }

  ///Get Tags List
  static Future<ResultApiModel> requestTags(params) async {
    final result = await httpManager.get(url: tags, params: params);
    return ResultApiModel.fromJson(result);
  }

  ///Clear Wish List
  static Future<ResultApiModel> requestDeleteProduct(params) async {
    final result = await httpManager.post(url: deleteProduct, data: params);
    return ResultApiModel.fromJson(result);
  }

  ///Get Author Product List
  static Future<ResultApiModel> requestAuthorList(params) async {
    final result = await httpManager.get(
      url: authorList,
      params: params,
    );
    return ResultApiModel.fromJson(result);
  }

  ///Get Author Review List
  static Future<ResultApiModel> requestAuthorReview(params) async {
    final result = await httpManager.get(
      url: authorReview,
      params: params,
    );
    return ResultApiModel.fromJson(result);
  }

  ///Get Review
  static Future<ResultApiModel> requestReview(params) async {
    final result = await httpManager.get(url: comments, params: params);
    return ResultApiModel.fromJson(result);
  }

  ///Save Review
  static Future<ResultApiModel> requestSaveReview(params) async {
    final result = await httpManager.post(url: saveComment, data: params);
    final convertResponse = {
      "success": result['code'] == null,
      "message": result['message'] ?? "save_data_success",
      "data": result
    };
    return ResultApiModel.fromJson(convertResponse);
  }

  ///Upload image
  static Future<ResultApiModel> requestUploadImage(formData, progress) async {
    var result = await httpManager.post(
      url: uploadImage,
      formData: formData,
      progress: progress,
    );

    final convertResponse = {"success": result['id'] != null, "data": result};
    return ResultApiModel.fromJson(convertResponse);
  }

  ///Singleton factory
  static final Api _instance = Api._internal();

  factory Api() {
    return _instance;
  }

  Api._internal();
}
