import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/page/dynamic/dynamic_page.dart';
import 'package:gsy_github_app_flutter/page/my_page.dart';
import 'package:gsy_github_app_flutter/page/trend/trend_page.dart';
// 底部导航栏，动态切换选中状态，使用StatefulWidget
class BottomSetState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

// 加载标签 和 对应页面
class _BottomNavigationState extends State<BottomSetState> {

  final GlobalKey<DynamicPageState> dynamicKey = new GlobalKey();
  final GlobalKey<TrendPageState> trendKey = new GlobalKey();
  final GlobalKey<MyPageState> myKey = new GlobalKey();

  //默认选中 0，_currentIndex当前选中
  int _currentIndex = 0;
  //定义List用于存储对应页面
  List<Widget> listLay = List();
  @override
  void initState() {
    //加载 定义的页面 按顺序，从左到右，对应底部导航栏页签
    listLay
      ..add( new DynamicPage(key: dynamicKey))
      ..add(new TrendPage(key: trendKey))
      ..add(new MyPage(key: myKey))
      ..add(new MyPage(key: myKey));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70, //页面背景颜色
       /* floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          backgroundColor: Colors.orange[200],
          child: Icon(Icons.add),
        ),*/
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: listLay[_currentIndex],
        // 创建底部导航栏
        bottomNavigationBar:_bottomNavBar2());
  }

  Widget _bottomNavBar2(){
    return new BottomNavigationBar(
      // items的标签数大于三个，需要重新设定type
      type: BottomNavigationBarType.fixed,
      // 第几个标签被激活，默认0
      currentIndex: _currentIndex,
      // 切换激活状态，_onTapHandle是回调监听方法
      onTap: _onTapHandle,
      // 激活状态的颜色
      fixedColor:Colors.orange,
      // items代码从上到下 对应 设备从左到右
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), //图标
            title: Text('home') //文字
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.edit_location), title: Text('edit_location')),
        BottomNavigationBarItem(
            icon: Icon(Icons.message), title: Text('Inbox')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Log In')),
      ],
    );
  }

  Widget _bottomNavBar() {
    return BottomAppBar(
      notchMargin: 4,
      shape: AutomaticNotchedShape(RoundedRectangleBorder(),RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child:  Container(
        margin: EdgeInsets.only(left: 50, right: 50),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              tooltip: "33",
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),

            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                setState(() {
                  _currentIndex =1;
                });

              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                setState(() {
                  _currentIndex =2;
                });

              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                setState(() {
                  _currentIndex =0;
                });

              },
            )
          ],
        ),
      ),
    );
  }

  //切换激活状态，_onTapHandle是回调监听方法
  void _onTapHandle(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}