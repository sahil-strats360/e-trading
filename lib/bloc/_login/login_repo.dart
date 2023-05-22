import '../../../constant.dart';

class LoginRepo {
  Future<dynamic> loginApi(String email, String password) async {
    print(email);
    print(password);
    //  FormData formdata = FormData.fromMap({"email": email, "password": password});

    // print(phone);
    var response = await DIO.post(
      "$BASE_URL/api/login",
      data: {"email": email, "password": password},
    );
    return response;
  }
}
