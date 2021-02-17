import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_task/screens/home_screen.dart';
import 'package:sample_task/splashScreen/splashScreen.dart';
import 'package:sample_task/theme/theme.dart';
import 'package:sample_task/utils/size_config.dart';

import 'screens/new_task.dart';





void main(){
  runApp(
      MyApp()
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppTheme.primaryColor,
            accentColor: AppTheme.primaryColor,
            cursorColor: AppTheme.primaryColor,
            splashColor: AppTheme.primaryColor,
            fontFamily: 'Roboto',
          ),
          home: NewTask(),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppTheme.primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }

}

