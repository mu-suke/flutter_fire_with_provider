import 'package:flutter/material.dart';
import 'package:flutter_firebase_provider/models/user.dart';
import 'package:flutter_firebase_provider/views/authenticate.dart';
import 'package:flutter_firebase_provider/views/home_page.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
