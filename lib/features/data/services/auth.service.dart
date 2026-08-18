import 'dart:developer';

import 'package:chat_app/core/network/api_routes.dart';
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

    if (response == null) return null;

    final authData = AuthData.fromJson(response);
    log(authData.toString());
    return authData;

  }

  Future<Map<String, dynamic>> login({
    required Map<String, dynamic> data,
  }) async => await HttpService.instance.post(ApiRoutes.login, data: data);

  Future<void> logout(String token) async {
    try {
      await HttpService.instance.post(ApiRoutes.logout, bearer: token);
    } catch (e) {
      log("Logout API call ignored (session might already be expired): $e");
    }

    await StorageService.instance.secureDelete('token');
    await StorageService.instance.secureDelete('userProfile');
  }

  // Future<void> logout({

  // })
}
