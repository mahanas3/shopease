import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_ease/provider/bag_provider.dart';
import 'package:shop_ease/provider/favourite_provider.dart';
import 'package:shop_ease/provider/home_provider.dart';
import 'package:shop_ease/provider/profile_provider.dart';
import 'package:shop_ease/provider/auth_provider.dart';
import 'package:shop_ease/provider/shop_provider.dart';
import 'package:shop_ease/provider/user_provider.dart';
import 'package:shop_ease/routes/route_name.dart';
import 'package:shop_ease/routes/route_navigation.dart';

bool email = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs?.getBool('isLogin') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ShopProvider()),
      ChangeNotifierProvider(create: (context) => BagProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: email ? RouteName.loginscreen : RouteName.homescreen,
      onGenerateRoute: AppRoute.routeSetting,
    );
  }
}
