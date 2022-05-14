import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  Home({Key? key}) : super(key:key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){

    final home_logo = Text( //어플 로고이미지로 변경
      "로고 위치",
      style: TextStyle(
          color: Colors.black),
    );

    final current_location = Text(
      "현재 위치",
      style: TextStyle( // 위도 및 경로를 활용하여 현위치 이름으로 변경.
          height: 2.2,
          fontSize: 22,
          color: Colors.black),
      textAlign: TextAlign.center,
    );

    final current_icon = IconButton(
        onPressed: (){
          print("위치 버튼 눌림.");
        }, icon: Icon(Icons.location_pin),
        color: Colors.black);

    Widget _bodyWidget(){
      return ListView.separated(itemBuilder: (

          BuildContext _context, int
          index){
        return Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)), // 이미지 모서리 둥글게 설정.
                child: Image.asset("assets/images/ara-${index+1}.jpg",
                  width:100,
                  height:100,
                ),
              ),
            ],
          ),
        );
      },
        itemCount: 10
        ,
        separatorBuilder: (

            BuildContext _context, int
            index){
          return Container(height: 1, color: Colors.black.withOpacity(0.4));
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title : home_logo,
        actions: <Widget>[
          current_location,
          current_icon,
        ],
      ),
      body: _bodyWidget(),
    );
  }
}


