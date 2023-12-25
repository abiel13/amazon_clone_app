// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/Common/widgets/bottom_bar.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/services/error_handling.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: 'user',
          token: '');

      http.Response res = await http.post(
          Uri.parse('$uri/api/v1/auth/create_user'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () {
            showSnackbar(
                context, 'Account Created Succesfully. Sign in to Continue',
                color: Colors.green[700]);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/v1/auth/login_user'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSucess: () async {
            showSnackbar(context, 'Login Sucessful', color: Colors.green[700]);
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();

            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

//get userData

  void getUserDAta(BuildContext context) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString("x-auth-token", '');
      }

      var tokenRes = await http.get(
          Uri.parse('$uri/api/v1/auth/validate_token'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        final res = await http.get(
            Uri.parse(
              '$uri/api/v1/auth/',
            ),
            headers: <String, String>{
              'x-auth-token': token,
              'Content-Type': 'application/json; charset=UTF-8',
            });
        Provider.of<UserProvider>(context , listen: false).setUser(res.body);
      }

    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
