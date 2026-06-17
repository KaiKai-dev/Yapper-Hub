import 'package:envied/envied.dart';

part "env.g.dart";

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'CHATAPPBACKENDURL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;
  
  @EnviedField(varName: 'CHATAPPAPIURL', obfuscate: true)
  static final String apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'CHATAPPACCESSKEY', obfuscate: true)
  static final String accessKey = _Env.accessKey;
}