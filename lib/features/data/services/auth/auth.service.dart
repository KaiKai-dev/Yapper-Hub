import 'dart:developer';

import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:chat_app/features/domain/models/auth_data/auth_data.model.dart';

// part 'auth.service.g.dart';

// @riverpod
// AuthService authService(Ref ref) => AuthService(ref);

class AuthService {
  AuthService();

  Future<AuthData?> restoreSession() async {
    final stored = await StorageService.instance.securedGet('token');

    if (stored == null) return null;
    
    final response = await HttpService.instance.get(
      ApiRoutes.verifyLogin,
      bearer: stored,
    );

    final authData = AuthData.fromJson(response);
    log(authData.toString());
    return authData;
  }

  Future<Map<String, dynamic>> login({
    required Map<String, dynamic> data,
  }) async {
    final response = await HttpService.instance.post(
      ApiRoutes.login,
      data: data,
    );

    return response;
  }

  Future<void> logout(String token) async =>
      await HttpService.instance.post(ApiRoutes.logout, bearer: token);
}
