import 'package:http/http.dart' as http;

class Services {
  final String email, password;
  final String? newEmail, newPassword;
  Services(
      {required this.email,
      required this.password,
      this.newEmail,
      this.newPassword});
  Future<bool> logIn() async {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      "email": email,
      "password": password
    };
    http.Response response = await http
        .get(Uri.parse("http://127.0.0.1:5000/auth"), headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> register() async {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      "email": email,
      "password": password
    };
    http.Response response = await http
        .put(Uri.parse("http://127.0.0.1:5000/auth"), headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> delete() async {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      "email": email,
      "password": password
    };
    http.Response response = await http
        .delete(Uri.parse("http://127.0.0.1:5000/auth"), headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> update() async {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      "email": email,
      "password": password,
      "newEmail": newEmail!,
      "newPassword": newPassword!
    };
    http.Response response = await http
        .patch(Uri.parse("http://127.0.0.1:5000/auth"), headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
