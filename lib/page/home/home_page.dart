import 'dart:async';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/common/localization/default_localizations.dart';
import 'package:gsy_github_app_flutter/common/style/gsy_style.dart';
import 'package:gsy_github_app_flutter/common/utils/navigator_utils.dart';
import 'package:gsy_github_app_flutter/page/dynamic/dynamic_page.dart';
import 'package:gsy_github_app_flutter/page/my_page.dart';
import 'package:gsy_github_app_flutter/page/trend/trend_page.dart';
import 'package:gsy_github_app_flutter/widget/gsy_tabbar_widget.dart';
import 'package:gsy_github_app_flutter/widget/gsy_title_bar.dart';
import 'package:gsy_github_app_flutter/page/home/widget/home_drawer.dart';
import 'package:gsy_github_app_flutter/page/main_page.dart';
import 'package:gsy_github_app_flutter/page/photoview_page.dart';
import 'package:gsy_github_app_flutter/page/profile_home.dart';
import 'package:gsy_github_app_flutter/test/demo_appbar.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:gsy_github_app_flutter/page/notify_page.dart';

import 'package:gsy_github_app_flutter/page/message/message_page.dart';
/**
 * 主页
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class HomePage extends StatefulWidget {
  static final String sName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<DynamicPageState> dynamicKey = new GlobalKey();
  final GlobalKey<TrendPageState> trendKey = new GlobalKey();
  final GlobalKey<MyPageState> myKey = new GlobalKey();

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 20.0), new Text(text)],
      ),
    );
  }

  _renderTab2(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new  FlutterBadge(
          icon: Icon(icon, size: 20.0),
          itemCount: 1,
          borderRadius: 20.0,
          textSize:10,
         // badgeColor: Colors.orange,
          hideZeroCount: true,
        ), new Text(text)],
      ),
    );
  }

  _renderBadgeTab(icon) {
    return new FlutterBadge(
      icon: Icon(icon),
      itemCount: 3,
      borderRadius: 20.0,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Icons.home, GSYLocalizations.i18n(context).home_dynamic),
      _renderTab(Icons.home, GSYLocalizations.i18n(context).home_dynamic),
      _renderTab2(Icons.message , GSYLocalizations.i18n(context).home_trend),
      _renderTab(Icons.person, GSYLocalizations.i18n(context).home_my),
    ];

    ///增加返回按键监听
    return Container(

      child: new GSYTabBarWidget(
       // drawer: new HomeDrawer(),
        type: TabType.bottom,
        tabItems: tabs,
        tabViews: [
          new MessagePage(),
          new MainUI(key: dynamicKey),
          new TrendPage(key: trendKey),
          //new MyPage(key: myKey),
          new ProfileHomePage(),
        ],
        onDoublePress: (index) {
          switch (index) {
            case 0:
              dynamicKey.currentState.scrollToTop();
              break;
            case 1:
              trendKey.currentState.scrollToTop();
              break;
            case 2:
              myKey.currentState.scrollToTop();
              break;
          }
        },
        backgroundColor: GSYColors.primarySwatch,
        indicatorColor: Colors.transparent,
       /* title: GSYTitleBar(
          GSYLocalizations.of(context).currentLocalized.app_name,
          iconData: GSYICons.MAIN_SEARCH,
          needRightLocalIcon: true,
          onRightIconPressed: (centerPosition) {
            NavigatorUtils.goSearchPage(context, centerPosition);
          },
        ),*/
      ),
    );
  }
}
