import 'dart:convert';

import 'package:bookingapp/data/data_source/remote/remote_data.dart';
import 'package:bookingapp/data/models/edit_user_model.dart';
import 'package:bookingapp/data/models/user_model.dart';
import 'package:bookingapp/data/repo/user_repository.dart';
import 'package:bookingapp/main.dart';
import 'package:http/http.dart' as http;

class UsersRepoImpl implements UserRepository {
  @override
  Future<User> editUser({required int id, required String password}) {
    return MainFun.postReq(User.fromJson, "Gusers/update",
        EditUser(id: id, myPassword: password).toJson());
  }

  @override
  Future<int> login(
      {required String username, required String password}) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
        'POST', Uri.parse('http://gaber.alfaysalerp.com/users/authenticate'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();

      // Decode the response body to a Map
      var responseBody = jsonDecode(responseString);
      MyApp.token = responseBody['jwtToken'];
      MyApp.userType = responseBody['userType'];
      MyApp.userName = responseBody['username'];
      MyApp.userId = responseBody['id'];
      return response.statusCode;
    } else {
      print(response.reasonPhrase);
      return response.statusCode;
    }
  }
}
