import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sample_task/screens/status_view.dart';
import 'package:sample_task/utils/app_assets.dart';
import 'package:sample_task/utils/app_routes.dart';

class WhatsappStatus extends StatefulWidget {
  @override
  _WhatsappStatusState createState() => _WhatsappStatusState();
}

class _WhatsappStatusState extends State<WhatsappStatus> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
            margin: EdgeInsets.all(10),
            child: new  StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => new Container(
                  color: Colors.green,
                  child: new Center(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text('$index'),
                    ),
                  )),
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )
          ),
    );
  }

  Widget uiCard() {
   return GestureDetector(
     onTap: ()=>AppRoutes.goto(context, StatusView()),
     child: Container(
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(20))
         ),
        child: Image.asset(Assets.logo2)
      ),
   );
  }
}
