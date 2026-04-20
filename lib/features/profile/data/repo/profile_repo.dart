import 'package:bookia_store/core/service/dio_helper.dart';
import 'package:bookia_store/core/utils/api_const.dart';
import 'package:bookia_store/core/utils/token_key_secuer.dart';
import 'package:bookia_store/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileRepo {
  const ProfileRepo._();

  static Future<ProfileModel?> getProfile() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await DioHelper.dio.get(ApiConst.showprofileEndpoint);
      if (response.statusCode == 200 && response.data != null) {
        return ProfileModel.fromJson(response.data!);
      }
      debugPrint(response.data.toString());
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> clearToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: TokenKeySecuer.tokenKey);
  }
}