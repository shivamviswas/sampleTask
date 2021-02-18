import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample_task/api/API.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  FocusNode searchFocus = new FocusNode();
  TextEditingController controller = new TextEditingController();

  String message = "";
  bool loading =false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // FocusScope.of(context).requestFocus(searchFocus);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
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
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    loading?Center(child: CircularProgressIndicator(backgroundColor: Colors.blueAccent,))
                        :FlatButton(
                      child: Text("Search"),
                      color: Colors.redAccent,
                      onPressed: (){
                            searchWeather();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text(message,style: TextStyle(color: Colors.black,fontSize: 20.0),),
            ],
          ),
        ),
      ),
    );
  }





  searchWeather()async{
    loading=true;
    setState(() {

    });
    API.get(API.weatherApi+"q=${controller.text.trim()}&appid=43a4973c933426ce03b69bf2fd0360e0","").then((response) {

      print(response.body);
      if(response.statusCode==200)
        {
          var data = json.decode(response.body);

          message="weather : ${data["weather"][0]["main"]}\nhumidity : ${data["main"]["humidity"]} \n"
              "wind speed : ${data["wind"]["speed"]} ";
        }
      else if(response.statusCode==404)
        {
          message=json.decode(response.body)["message"];
        }
      loading=false;

      setState(() {

      });

    });
  }
}
