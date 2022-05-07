import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/page/Home.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //List<Map<String,String>> datas =[];
   late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

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
      switch (_currentPageIndex){
        case 0:
          return Home();
          break;
        case 1:
          return Container();
          break;
        case 2:
          return Container();
          break;
        case 3:
          return Container();
          break;
        case 4:
          return Container();
          break;
      }
      return Container();
    }


    BottomNavigationBarItem _bottomNavigationBarItem(
    String iconName, String label) {
      return BottomNavigationBarItem(
          icon:Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset("assets/svg/${iconName}_off.svg",width:22),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset("assets/svg/${iconName}_on.svg",width:22),
          ),
          label: label,
      );
    }

    Widget _bottomNavigationBarwidget(){
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //설정 하지않으면 아이콘 누를경우 위로 올라감.
        onTap: (int index){
          // print(index); // 작동하는지 테스트.
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedFontSize: 12,
        selectedItemColor: Colors.black, // 선택한 아이콘 글자 표시 및 색상 설정
        selectedLabelStyle: TextStyle(color: Colors.black),// 선택한 아이콘 글자 표시 및 색상 설정
        items: [
          _bottomNavigationBarItem("home", "홈"),
          _bottomNavigationBarItem("location", "지도"),
          _bottomNavigationBarItem("notes", "캘린더"),
          _bottomNavigationBarItem("chat", "커뮤니티"),
          _bottomNavigationBarItem("user", "설정"),
        ],
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
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }
}
