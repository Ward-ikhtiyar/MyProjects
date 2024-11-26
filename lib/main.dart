import 'package:SpeedOrder/MainPage.dart';
import 'package:SpeedOrder/signInpage.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Model(),
    builder: (context, child) {
      return const MyHomePage();
    },
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: model.loggedin ? const HomePage() : const Sign_in_Page());
    });
  }
}

class Model extends ChangeNotifier {
  get logged => loggedin;
  bool loggedin = false;
  Model() {
    checkLoginStatus();
  }
  Future<bool?> checkLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    loggedin = sp.getBool("login") ?? false;
    notifyListeners();
    return null;
  }

  Future<bool?> Logintrue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    loggedin = true;
    sp.setBool("login", true);
    notifyListeners();
    return null;
  }

  Future<bool?> Loginfalse() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    loggedin = false;
    sp.setBool("login", false);
    notifyListeners();
    return null;
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // ignore: non_constant_identifier_names
  int Buttonindex = -1;
}
