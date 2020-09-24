import 'package:flutter/material.dart';
import 'package:flutter_firebase_provider/models/user.dart';
import 'package:flutter_firebase_provider/views/home_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
