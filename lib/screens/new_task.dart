import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample_task/screens/search.dart';
import 'package:sample_task/utils/app_assets.dart';
import 'package:sample_task/utils/app_routes.dart';
import 'package:sample_task/utils/size_config.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var category = ["FOOTWEAR", "HOME", "GADGETS", "JEWELERY", "CLOTHS"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6feff),
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.widthMultiplier * 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              _headerContainer(),
              _circleImageList(),
              SizedBox(
                height: 16,
              ),
              _midTileContainer(),
              SizedBox(
                height: 16,
              ),
            _endContainer()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/logos.png',
                height: 56,
                width: 74,
              )),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: SizeConfig.heightMultiplier * 5,
              child: TextField(
                onTap: (){
                  AppRoutes.gotoFullScreen(context, SearchResult());
                },
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1.0, horizontal: 6),
                  isDense: true,

                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 0.5),
                      borderRadius: BorderRadius.circular(5)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
              ),
              child: Image.asset(Assets.placeHolder),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleImageList() {
    return Container(
      height: SizeConfig.heightMultiplier * 12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _circleImageContainer(index);
        },
      ),
    );
  }

  Widget _circleImageContainer(index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://cdn.pixabay.com/photo/2017/07/02/19/24/dumbbells-2465478_960_720.jpg",
              fit: BoxFit.cover,
              placeholder: (context, url) => SpinKitFadingCircle(
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(category[index],
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        ],
      ),
    );
  }

  _midTileContainer() {
    return Container(
      height: SizeConfig.heightMultiplier * 26,
      width: SizeConfig.widthMultiplier * 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Special Offers',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              Text('View more',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      decoration: TextDecoration.underline)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: SizeConfig.heightMultiplier * 21,
                      width: SizeConfig.widthMultiplier * 70,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/ssss.jpg",
                            height: SizeConfig.heightMultiplier * 21,
                            width: SizeConfig.widthMultiplier * 70,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            color: Colors.black.withOpacity(0.4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Rs. 300/- off on this items',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20)),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Use code GPS, now till Mar 1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14)),
                                SizedBox(
                                  height: 8,
                                ),
                                OutlineButton(
                                  onPressed: () {},
                                  padding: EdgeInsets.all(2),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  child: Text('View Now',
                                      style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _endContainer() {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Your Offers', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          _yourOfferCard(),
          _yourOfferCard(),
          _yourOfferCard()
        ],
      ),
    );
  }

  _yourOfferCard(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: SizeConfig.heightMultiplier * 16,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/new.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              height: 30,
                              width: 30,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Ballon Plant', style: TextStyle(fontSize: 14)),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Get 75% off',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(
                    height:16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('From raymonds',
                          style: TextStyle(fontSize: 10)),
                      Text('Go to shop',
                          style: TextStyle(fontSize: 10,color: Colors.blue,decoration: TextDecoration.underline)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: SizeConfig.heightMultiplier * 16,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/new.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              height: 30,
                              width: 30,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.heart_fill,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Ballon Plant', style: TextStyle(fontSize: 14)),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Get 75% off',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(
                    height:16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('From raymonds',
                          style: TextStyle(fontSize: 10)),
                      Text('Go to shop',
                          style: TextStyle(fontSize: 10,color: Colors.blue,decoration: TextDecoration.underline)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
