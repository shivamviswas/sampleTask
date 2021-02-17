import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_task/screens/widgets/user_head.dart';
import 'package:sample_task/theme/theme.dart';
import 'package:sample_task/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppTheme.primaryColor,
          appBar: AppBar(
            backgroundColor: AppTheme.primaryColor,
            elevation: 2,
            title:Image.asset('assets/images/logo.png',height: 25,),
          ),
          drawer: Container(),
          body: SingleChildScrollView(
            child: Container(
              width: SizeConfig.widthMultiplier*100,
             child: Column(
               children: <Widget>[
                 _circleHeads(),
               ],
             ),
            ),
          ),
        )
    );
  }

  Widget _circleHeads() {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
        return UserCircleHead(
          isSeen: false,
          name: "Shiva",
          image: "assets/images/img.jpg",
        );
      },),
    );
  }
}
