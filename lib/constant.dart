import 'package:dio/dio.dart';
import 'package:mymoney/bloc/_account/account_cubit.dart';
import 'package:mymoney/bloc/_auth/auth_cubit.dart';

const String BASE_URL = "https://etrading.360websitedemo.com";

final Dio DIO = Dio();

const String UNAUTHENTICATED = "unauthenticated_user";

bool change = false;
AuthCubit authcubit = AuthCubit();
