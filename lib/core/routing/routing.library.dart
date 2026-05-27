library routing_library;

import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/auth/presentation/pages/login.page.dart';
import 'package:chat_app/features/auth/presentation/pages/signup.page.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up/result/sign_up.result.success.screen.dart';
import 'package:chat_app/features/splash/presentation/pages/splash.page.dart';
import 'package:chat_app/features/splash/presentation/pages/welcome.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routing.builder.dart';
part 'routing.config.dart';
part 'routing.service.dart';
part 'routing.transition.delegate.dart';
part 'routing.transition.enum.dart';