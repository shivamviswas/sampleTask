import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_task/theme/theme.dart';

class UserCircleHead extends StatelessWidget {
  final String name;
  final String image;
  final bool isSeen;
  Function onTap;

  UserCircleHead({@required this.name, @required this.image, @required this.isSeen, onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12,top: 6),
      child: InkWell(
        child: Column(
          children: [
            Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain
              ),
              border: Border.all(color:isSeen? Colors.transparent: AppTheme.accentColor,width: 3),
            ),
      ),
            Container(
              child: Text(name, style: TextStyle(color: Colors.white,fontSize: 12)),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
