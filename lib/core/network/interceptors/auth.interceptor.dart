import 'package:chat_app/core/network/api_routes.dart';
import 'package:chat_app/core/providers_container.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/routing/routing.service.dart';
import 'package:chat_app/features/data/providers/auth_provider/auth.provider.dart';
import 'package:chat_app/features/data/services/storage.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //*
    //*   Proceeds if:
    //*     - Request provides the bearer (For restoreSession())
    //*     - Request does not require a bearer token
    //*
    if (options.headers['Authorization'] != null ||
        ApiRoutes().nonTokenRequests.contains(options.path)) {
      return handler.next(options);
    }

    //*
    //*   Adds the token if it exists in authProvider
    //*
    final token = appContainer.read(authProvider)?.token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    //*
    //*   Redirects the user out of the main interface
    //*   if the token is:
    //*     - Unauthorized
    //*     - Expired
    //*
    if (err.response?.statusCode == 401) {
      // Clear stored session tokens locally
      await StorageService.instance.secureDelete('token');
      await StorageService.instance.secureDelete('userProfile');

      // Navigate to welcome screen
      RoutingService.instance.router.replaceNamed(AppScreens.welcome.name);

      toastification.show(
        title: const Text("Login Session Expired"),
        description: const Text("Login again to continue Yapping"),
        autoCloseDuration: const Duration(seconds: 5),
        alignment: .bottomCenter
      );

      return handler.next(err);
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
