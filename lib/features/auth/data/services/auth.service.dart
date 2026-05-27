import 'package:chat_app/core/network/api_endpoints.dart';
import 'package:chat_app/core/network/http_service.dart';
import 'package:chat_app/features/auth/domain/models/signup.data.model/signup.data.model.dart';

class AuthService {
  AuthService._internal();
  static final AuthService internal = AuthService._internal();

  void signup(SignupDataModel data) async {
    final json = data.toMap();

    final response =  await HttpService.instance.post(
      ApiRoutes.signup,
      data: json,
    );
    
  }

  // TODO: add login logic
  // void login({
  //   required String email,
  //   required String password,
  // }){
  //   final response = HttpService.instance.get(
  //     ApitR
  //   )
  // }
}