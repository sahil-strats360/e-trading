import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mymoney/screen/auth/login/login_screen.dart';
import 'package:mymoney/screen/welcome/welcome_screen.dart';

import '../bloc/_login/login_cubit.dart';
import '../constant.dart';
import '../screen/auth/verification.dart';

final storage = FlutterSecureStorage();
String Token;

Future<void> storeToken(String token) async {
  Token = token;
  // print(Token);
  await storage.write(key: "token", value: token);
}

Future<void> getToken() async {
  Token = await storage.read(key: "token");
  print(Token);
}

Future<void> deletToken() async {
  Token = null;
  if (change == false) {
  await storage.delete(key: "token");
    Get.to(
      BlocProvider(create: (context) => LoginCubit(), child: LogInScreen()),
    );
    // SystemNavigator.pop();
  }
}
