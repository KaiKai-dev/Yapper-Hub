import 'package:envied/envied.dart';

part "env.g.dart";

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CHATAPPBACKENDURL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'CHATAPPACCESSKEY', obfuscate: true)
  static final String accessKey = _Env.accessKey;
}