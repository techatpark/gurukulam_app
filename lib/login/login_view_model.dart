import 'package:gurukulam_app/core/authentication_manager.dart';
import 'package:gurukulam_app/core/cache_manager.dart';
import 'package:gurukulam_app/login/model/login_request_model.dart';
import 'package:gurukulam_app/login/model/register_request_model.dart';
import 'package:gurukulam_app/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(userName: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String email, String password, String imageUrl) async {
    final response = await _loginService
        .fetchRegister(RegisterRequestModel(email: email, password: password,imageUrl: imageUrl));

    if (response == true) {
      /// Set isLogin to true
      // Get.back();
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
