import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mymoney/bloc/_auth/auth_cubit.dart';
import 'package:mymoney/bloc/_auth/auth_state.dart';
import 'package:mymoney/bloc/_login/login_cubit.dart';
import 'package:mymoney/screen/auth/login/login_screen.dart';
import 'package:mymoney/screen/auth/verification.dart';
import 'package:mymoney/utils/sequre_storage.dart';
import 'constant.dart';
import 'screen/welcome/welcome_screen.dart';

import 'utils/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await getToken();
    // await deletToken();
    print(Token);
  } catch (e) {
    // todo nothing
  }

  if (Token != null) {
    await authcubit.loadUserDetails();
  }

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(BlocProvider(create: (context) => authcubit, child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          //todo
        },
        builder: (context, state) {
          if (state is Authenticated) {
            return VerificationScreen();
          }
          if (state is UnAuthenticated) {
            return BlocProvider(
              create: (context) => LoginCubit(),
              child: LogInScreen(),
            );
          }
          return WelcomeScreen();
        },
      ),

      //change == true || Token != null
      //     ? VerificationScreen()
      //     : WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: white,
        ),
      ),
    );
  }
}
