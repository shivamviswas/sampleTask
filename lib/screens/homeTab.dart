import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_task/screens/tabs/whatsapp_status.dart';
import 'package:sample_task/theme/theme.dart';
import 'package:sample_task/utils/size_config.dart';

class HomeTabScreens extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeTabScreens> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        ////////////////header///////////////////////////
        appBar: AppBar(
          elevation: 0,
          title: Text('Status Baba'),
          actions: [
            Container(
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier*5),
              child: Icon(Icons.file_download,color: AppTheme.appWhite,)),
            Container(
              margin: EdgeInsets.only(right: SizeConfig.widthMultiplier*5),
              child: Icon(Icons.share,color: AppTheme.appWhite,))
          ],
        ),
        /////////////////////////////body/////////////////////////////////
        body: Container(
          color: AppTheme.primaryColor,
          child: Column(children: [
            Container(
              height: SizeConfig.heightMultiplier*5,
              child: TabBar(
                unselectedLabelColor: Colors.red,
                labelPadding: EdgeInsets.all(3.0),
                labelColor: Colors.white,
                indicatorWeight: 1,

                tabs: [
                  Container(
                    padding: EdgeInsets.only(left: 8,top: 4,bottom: 4),
                    child: Center(
                      child: SvgPicture.string(
                        home,
                        allowDrawingOutsideViewBox:
                        true,
                        height: SizeConfig.widthMultiplier*24,
                        width: SizeConfig.widthMultiplier*24,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8,top: 4,bottom: 4),
                    child: Center(
                      child: SvgPicture.string(
                        globe,
                        allowDrawingOutsideViewBox:
                        true,
                        height: SizeConfig.widthMultiplier*24,
                        width: SizeConfig.widthMultiplier*24,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8,top: 4,bottom: 4),
                    child: Center(
                      child: SvgPicture.string(
                        message,
                        allowDrawingOutsideViewBox:
                        true,
                        height: SizeConfig.widthMultiplier*24,
                        width: SizeConfig.widthMultiplier*24,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8,top: 4,bottom: 4),
                    child: Center(
                      child: SvgPicture.string(
                        profile,
                        allowDrawingOutsideViewBox:
                        true,
                        height: SizeConfig.widthMultiplier*24,
                        width: SizeConfig.widthMultiplier*24,
                      ),
                    ),
                  ),

                ],
                controller: _tabController,
                indicatorColor: Colors.white,
                unselectedLabelStyle: TextStyle(color: Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Container(
              height: SizeConfig.heightMultiplier*85,
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: WhatsappStatus() ,

                  ),
                  Container(
                    //   child: AnnouncementList2(),
                  ),
                  Container(

                    //   child: AnnouncementList2(),
                  ),
                  Container(

                    //   child: AnnouncementList2(),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ],)
        ),
      ),
    );
  }
}
const home = '<svg id="__TEMP__SVG__" xmlns="http://www.w3.org/2000/svg" width="31.881" height="30.001" viewBox="0 0 31.881 30.001"> <path id="Path_3" data-name="Path 3" d="M33.71,16.334l-15-14.063a1.048,1.048,0,0,0-1.41,0L2.3,16.334a.9.9,0,0,0,.052,1.273,1.049,1.049,0,0,0,1.358.049L18,4.259,32.29,17.666a1.049,1.049,0,0,0,1.358-.049.9.9,0,0,0,.052-1.273Z" transform="translate(-2.06 -1.999)" fill="#fff"/><path id="Path_4" data-name="Path 4" d="M28,31.11H23V21.735H13V31.11H8V17.985L6,19.86V31.11a1.941,1.941,0,0,0,2,1.875h7V23.61h6v9.375h7a1.941,1.941,0,0,0,2-1.875V19.635L28,17.76Z" transform="translate(-2.06 -2.984)" fill="#fff"/></svg>';
const globe = '<svg xmlns="http://www.w3.org/2000/svg" width="29.257" height="29.25" viewBox="0 0 29.257 29.25"> <path id="Icon_ionic-ios-globe" data-name="Icon ionic-ios-globe" d="M18,3.375h-.049a14.625,14.625,0,0,0,.007,29.25h.049A14.625,14.625,0,1,0,18,3.375ZM30.67,17.016H25.214a27.689,27.689,0,0,0-.689-5.358,21.42,21.42,0,0,0,3.495-1.477A12.6,12.6,0,0,1,30.67,17.016Zm-13.655,0H12.67a24.992,24.992,0,0,1,.619-4.859,21.392,21.392,0,0,0,3.727.5Zm0,1.969v4.352a21.482,21.482,0,0,0-3.727.5,24.989,24.989,0,0,1-.619-4.852Zm1.969,0h4.31a24.845,24.845,0,0,1-.619,4.845,20.988,20.988,0,0,0-3.691-.492Zm0-1.969V12.656a21.483,21.483,0,0,0,3.691-.492,24.919,24.919,0,0,1,.619,4.852Zm7.692-8.29A19.533,19.533,0,0,1,24,9.816a14.518,14.518,0,0,0-1.863-3.832A12.724,12.724,0,0,1,26.677,8.726Zm-4.528,1.6a19.788,19.788,0,0,1-3.164.422V5.583C20.18,6.23,21.347,7.966,22.148,10.322ZM17.016,5.555v5.182a19.447,19.447,0,0,1-3.2-.429C14.632,7.931,15.813,6.195,17.016,5.555ZM13.809,6a14.632,14.632,0,0,0-1.849,3.8A19.973,19.973,0,0,1,9.323,8.726,12.533,12.533,0,0,1,13.809,6ZM7.98,10.188a21,21,0,0,0,3.459,1.462,26.573,26.573,0,0,0-.689,5.358H5.337A12.532,12.532,0,0,1,7.98,10.188Zm-2.651,8.8h5.414a27.618,27.618,0,0,0,.689,5.358A22.277,22.277,0,0,0,7.973,25.8,12.6,12.6,0,0,1,5.33,18.984Zm3.987,8.29a19.678,19.678,0,0,1,2.644-1.083A14.684,14.684,0,0,0,13.809,30,12.845,12.845,0,0,1,9.316,27.274Zm4.5-1.589a19.549,19.549,0,0,1,3.2-.429v5.189C15.806,29.805,14.632,28.062,13.816,25.685Zm5.168,4.732V25.249a19.789,19.789,0,0,1,3.164.422C21.347,28.034,20.18,29.77,18.984,30.417Zm3.164-.4a14.518,14.518,0,0,0,1.863-3.832,19.212,19.212,0,0,1,2.672,1.1A12.869,12.869,0,0,1,22.148,30.016Zm5.871-4.2a21.42,21.42,0,0,0-3.495-1.477,27.545,27.545,0,0,0,.689-5.351H30.67A12.542,12.542,0,0,1,28.02,25.812Z" transform="translate(-3.375 -3.375)" fill="#fff"/></svg>';
const message = '<svg id="bx-message-minus" xmlns="http://www.w3.org/2000/svg" width="30.066" height="29.63" viewBox="0 0 30.066 29.63"> <path id="Path_1" data-name="Path 1" d="M31.362,3H5.1C3.446,3,3,3.056,3,4.711L2.934,24.267c0,1.655.512,1.865,2.167,1.865h6.514v6.5l8.095-6.5H31.223c1.655,0,1.777-.21,1.777-1.865V6C33,4.345,33.017,3,31.362,3Zm-.139,21.267H19.193L13.5,28.333V24.267H5.1V4.711H31.362Z" transform="translate(-2.934 -3)" fill="#fff"/><path id="Path_2" data-name="Path 2" d="M12,13.5H24v2.2H12Z" transform="translate(-2.934 -2.199)" fill="#fff"/></svg>';
const profile = '<svg xmlns="http://www.w3.org/2000/svg" width="26" height="30" viewBox="0 0 26 30"> <g id="user-line" transform="translate(0)"><path id="Path_5" data-name="Path 5" d="M18,17a7,7,0,1,0-7-7,7,7,0,0,0,7,7ZM18,5a5,5,0,1,1-5,5A5,5,0,0,1,18,5Z" transform="translate(-5 -3)" fill="#fff"/><path id="Path_6" data-name="Path 6" d="M30.47,24.37a17.16,17.16,0,0,0-24.93,0A2,2,0,0,0,5,25.74V31a2,2,0,0,0,2,2H29a2,2,0,0,0,2-2V25.74a2,2,0,0,0-.53-1.37ZM29,31H7V25.73a15.17,15.17,0,0,1,22,0Z" transform="translate(-5 -3)" fill="#fff"/></g></svg>';