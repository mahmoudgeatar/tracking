import 'package:flutter/material.dart';
import 'package:flutter_optimum/provider/infoProvider.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var getData = Provider.of<Edit>(context, listen: false);
    getData.splashNavigator(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
