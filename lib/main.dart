import 'package:flutter/material.dart';
import 'package:flutter_optimum/screens/logIn.dart';
import 'package:provider/provider.dart';

import 'provider/infoProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Edit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OptimumFleet',
        home: LogIn(),
      ),
    );
  }
}
