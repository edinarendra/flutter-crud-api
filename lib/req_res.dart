import 'dart:convert';

import 'package:flutter_crud/model/user.dart';
import 'package:http/http.dart' as http;

class ApiConnection {
  final _baseUrl = 'https://627c75c1e5ac2c452af07ff2.mockapi.io/api/v1';

  Future getUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/users'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable i = jsonDecode(response.body);
        List<User> user = i.map((e) => User.fromJson(e)).toList();

        return user;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postUsers(String name, String phoneNumber) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/users'),
          body: {'name': name, 'phoneNumber': phoneNumber});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateUsers(int id, String name, String phoneNumber) async {
    try {
      final response = await http.put(
          Uri.parse(_baseUrl + '/users/' + id.toString()),
          body: {'name': name, 'phoneNumber': phoneNumber});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteUseres(int id) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + '/users/' + id.toString()));

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
