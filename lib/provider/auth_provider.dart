import 'package:flutter/cupertino.dart';
import 'package:shop_ease/model_class/user_model.dart';
import 'package:shop_ease/services/api_function.dart';
import '../routes/route_name.dart';

class AuthProvider extends ChangeNotifier {
  Details? signUpPage;

  void signUpScreen(BuildContext context, String UserName, String Password,
      String Name, String PhoneNo) async {
    try {
      signUpPage =
          await ApiServices().signUp(UserName, Password, Name, PhoneNo);
      print(signUpPage);
      Navigator.pushReplacementNamed(context,
          RouteName.homescreen);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/home');
    notifyListeners();
  }

  void forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot');
    notifyListeners();
  }
}
