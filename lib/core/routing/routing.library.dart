library routing_library;

import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/features/presentation/chats/chats.screen.dart';
import 'package:chat_app/features/presentation/home/home.shell.dart';
import 'package:chat_app/features/presentation/login/login.screen.dart';
import 'package:chat_app/features/presentation/menu/menu.screen.dart';
import 'package:chat_app/features/presentation/people/people.screen.dart';
import 'package:chat_app/features/presentation/signup/result/sign_up.result.error.screen.dart';
import 'package:chat_app/features/presentation/signup/result/sign_up.result.processing.screen.dart';
import 'package:chat_app/features/presentation/signup/signup.screen.dart';
import 'package:chat_app/features/presentation/signup/result/sign_up.result.success.screen.dart';
import 'package:chat_app/features/presentation/splash/pages/splash.screen.dart';
import 'package:chat_app/features/presentation/splash/pages/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routing.builder.dart';
part 'routing.config.dart';
part 'routing.transition.delegate.dart';
part 'routing.transition.enum.dart';