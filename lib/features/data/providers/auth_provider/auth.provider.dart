import 'dart:convert';

import 'package:chat_app/features/data/services/auth/auth.service.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:chat_app/features/domain/models/auth_data/auth_data.model.dart';

part 'auth.provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthData? build() => null;

  Future<void> restoreSession() async {
    final service = AuthService();
    final session = await service.restoreSession();

    state = session;
    
  }

  Future<void> login({required Map<String, dynamic> data}) async {
    final response = await AuthService().login(
      data: data
    );


    final authData = AuthData.fromJson(response);

    StorageService.instance.secureStore('token', authData.token!);
    StorageService.instance.secureStore('userProfile', jsonEncode(authData.profile.toJson()));

    state = authData;
  }

  Future<void> logout() async {
    if(state == null) return;
    await AuthService().logout(state!.token!);

    StorageService.instance.secureDelete('token');
    StorageService.instance.secureDelete('userProfile');

    state = null;
  }
}