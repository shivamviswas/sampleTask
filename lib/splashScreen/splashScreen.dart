import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_task/screens/homeTab.dart';
import 'package:sample_task/screens/home_screen.dart';
import 'package:sample_task/theme/theme.dart';
import 'package:sample_task/utils/ShareManager.dart';
import 'package:sample_task/utils/app_assets.dart';
import 'package:sample_task/utils/app_routes.dart';
import 'package:sample_task/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    refreshPermission();
    // callScreen();
    _initAnimation();
  }

  _initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));

    animationController.forward();
  }

  //Call screen based on conditions
  callScreen() async {
    ShareMananer.isLogin().then((userDetails) {
      bool isLogin = userDetails["login"];

      if (!isLogin) {
        Future.delayed(Duration(seconds: 3), () {
          AppRoutes.makeFirst(context, HomeScreen());
        });
      } else {
        Future.delayed(Duration(seconds: 3), () {
          AppRoutes.makeFirst(context, HomeScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //  appSizeInit(context);
    return SafeArea(
      right: false,
      bottom: false,
      left: false,
      top: false,
      child: Scaffold(
          body: Container(
        width: double.maxFinite,
        color: AppTheme.primaryColor,
        child: Center(
          child: Stack(
            children: <Widget>[
              Image.asset(
                Assets.splashback,
                height: SizeConfig.heightMultiplier * 100,
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (ctx, child) {
                  return Transform(
                    transform: Matrix4.translationValues(
                        SizeConfig.widthMultiplier * 100 * animation.value,
                        0.0,
                        0.0),
                    child: Center(
                      child: Transform.rotate(
                        angle:  animation.value*4,
                        child: Image.asset(
                          Assets.logo2,
                          height: SizeConfig.heightMultiplier * 30,
                        ),
                      ),
                    ),
                  );
                },
              )
              /* SvgPicture.string(
                    splash_icon,
                    allowDrawingOutsideViewBox:
                    true,
                    height: SizeConfig.widthMultiplier*24,
                    width: SizeConfig.widthMultiplier*24,
                  ),*/
            ],
          ),
        ),
      )),
    );
  }

  refreshPermission() async {
//    if (await Permission.location.request().isDenied) {
//
//
//      // You can request multiple permissions at once.
//      Map<Permission, PermissionStatus> statuses = await [
//        Permission.location,
//        Permission.locationWhenInUse,
//        Permission.locationAlways
//      ].request();
//      print(statuses[Permission.location]);
//      // Either the permission was already granted before or the user just granted it.
//    }

   callScreen();
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppTheme.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));
  }
}

const splash_icon =
    '<svg xmlns="http://www.w3.org/2000/svg" width="94" height="111" viewBox="0 0 94 111"> <g id="logo" transform="translate(-76.323 -237)"><text id="Moneyhook" transform="translate(76.323 344)" fill="#fff" font-size="15" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">MONEYHOOK</tspan></text><path id="Path_161" data-name="Path 161" d="M278.433,333.483v41.032a3.84,3.84,0,0,0,7.68,0V341.942l8.448-8.341v40.42a12.288,12.288,0,1,1-24.576,0V357.345h-11.41v16.676a12.288,12.288,0,1,1-24.576,0V333.6l8.448,8.341v32.573a3.84,3.84,0,0,0,7.68,0V333.483l-7.68-7.583L234,317.559V306l8.448,8.34L253,324.761l5.573,5.5v19.731h11.41V330.264l5.573-5.5,10.555-10.42,8.448-8.34v11.559l-8.448,8.341Z" transform="translate(-139.677 -69)" fill="#fff"/></g></svg>';
