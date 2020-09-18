import 'package:flutter/material.dart';
import 'package:somass_app/app/shared/models/enter_response.dart';
import 'package:somass_app/app/shared/services/local_data.dart';

class Helper {
  static void toLoginNoBack(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
  }

  static void toHomeNoBack(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
  }

  static void toNameNoBack(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/name", (r) => false);
  }

  static void splashClientDirect(BuildContext context) async {
    final localData = LocalData();

    try {
      final token = await localData.getToken();
      final fullName = await localData.getFullName();

      if (token == null) {
        return toLoginNoBack(context);
      }

      if (fullName == "") {
        return toNameNoBack(context);
      }

      toHomeNoBack(context);
    } catch (e) {
      toLoginNoBack(context);
    }
  }

  static void exitFromApp(BuildContext context) async {
    final localData = LocalData();

    try {
      await localData.removeToken();

      localData.removeCPF();
      localData.removeFullName();
      localData.removeEscorts();

      toLoginNoBack(context);
    } catch (e) {
      toLoginNoBack(context);
    }
  }

  static void loginClientDirect(BuildContext context, EnterResponse enterResponse) async {
    try {
      if (enterResponse.fullName == "") {
        return toNameNoBack(context);
      }

      toHomeNoBack(context);
    } catch (e) {
      toLoginNoBack(context);
    }
  }
}
