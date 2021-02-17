import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_task/theme/theme.dart';
import 'package:sample_task/utils/app_assets.dart';
import 'package:sample_task/utils/size_config.dart';

class StatusView extends StatefulWidget {
  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Status Baba'),
      ),
      body: Container(
        color: Colors.brown,
        height: SizeConfig.heightMultiplier*100,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Image.asset(Assets.logo2,
                fit: BoxFit.contain,
                width: SizeConfig.widthMultiplier*100,),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: ()=>_settingModalBottomSheet(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(left:SizeConfig.heightMultiplier *5
                  ,bottom: 20),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: SizeConfig.widthMultiplier*80,
                  child: Center(
                    child: Text('Download',style: AppTheme.textStyle.heading1.copyWith(
                      color: AppTheme.appWhite
                    ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}
                ),
              ],
            ),
          );
        }
    );
  }
}
