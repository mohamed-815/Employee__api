import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:machin__test/const/conststring.dart';
import 'package:http/http.dart' as http;
import 'package:machin__test/model/loginmodel.dart';

class SignupService {
  Future<LoginModel> signIn(
      {required String email, required String password}) async {
    final client = http.Client();
    const url = "${baseUrl}auth/login";

    //final uri = Uri.https('api.revooerp.com', '/auth/login');
    final uri = Uri.parse(url);
    final body = {"email": email, "password": password};
    log('dfffffffffff');
    final response = await client.post(uri, body: body);
    log("122");
    if (response.statusCode == 200) {
      log(response.body.toString());
      final json = jsonDecode(response.body);
      return LoginModel.fromJson(json);
    } else {
      log(response.body.toString());
      return Future.error('some thing went wrong');
    }
  }
}
