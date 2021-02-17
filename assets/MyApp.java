import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/DailyOffering.dart';
import 'package:flutter_app/screens/Dispatch_due.dart';
import 'package:flutter_app/screens/Stocks.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:flutter_app/utils/size_config.dart';

import 'screens/Homepage.dart';



void main(){
 // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  /*runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      )
      );*/
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
            accentColor: AppTheme.darkPrimary,
            cursorColor: AppTheme.primaryColor,
            splashColor: AppTheme.primaryColor,
            fontFamily: 'Roboto',
          ),
          home: StocksScreen(),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppTheme.darkPrimary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  }

}

