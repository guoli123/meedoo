import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_colors.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_fonts.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_icons.dart';
import 'package:gsy_github_app_flutter/page/profile/models.dart';
import 'dart:math';
import 'package:gsy_github_app_flutter/common/style/gsy_style.dart';
import 'package:gsy_github_app_flutter/widget/gsy_user_icon_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsy_github_app_flutter/page/profile/colors.dart';
import 'package:gsy_github_app_flutter/page/login/login_ui.dart';
import 'package:gsy_github_app_flutter/page/login/signup_ui.dart';
import 'package:gsy_github_app_flutter/redux/gsy_state.dart';
import 'package:gsy_github_app_flutter/model/User.dart';
import 'package:gsy_github_app_flutter/common/dao/user_dao.dart';
import 'package:redux/redux.dart';

abstract class BaseProfileState<T extends StatefulWidget> extends State<T>  {


  @protected
  Widget renderItem(BuildContext context,Profile profile, User userInfo) {
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top;

    final headerGradient = new RadialGradient(
      center: Alignment.topLeft,
      radius: 0.4,
      colors: <Color>[
        const Color(0xFF8860EB),
        const Color(0xFF8881EB),
      ],
      stops: <double>[
        0.4, 1.0,
      ],
      tileMode: TileMode.repeated,
    );

    const headerHeight = 160.0;

    return new Container(
      height: headerHeight,
      decoration: new BoxDecoration(
        color: Colors.orange,
        boxShadow: <BoxShadow>[
          new BoxShadow(spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: new Offset(0.0, 1.0),
              color: Colors.white54),
        ],
      ),
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
                top: topPadding, left: 15.0, right: 15.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                new Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                  child: _buildAvatar(context,profile, userInfo),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }




  /// The avatar consists of the profile image, the users name and location
  Widget _buildAvatar(BuildContext context,Profile profile, User userInfo) {
    final mainTextStyle = new TextStyle(fontFamily: ProfileFontNames.TimeBurner,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 20.0);
    final subTextStyle = new TextStyle(
        fontFamily: ProfileFontNames.TimeBurner,
        fontSize: 16.0,
        color: Colors.white70,
        fontWeight: FontWeight.w700);

    return new Row(
      children: <Widget>[


        new Container(
          width: 80.0,
          height: 80.0,
          margin: const EdgeInsets.only(right: 0.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          alignment: Alignment.center,
          child: new GSYUserIconWidget(
              padding: const EdgeInsets.only(top:5,right: 10.0, left: 10.0),
              width: 80.0,
              height: 70.0,
              image: GSYICons.DEFAULT_REMOTE_PIC,
              onPressed: () {

              }),
        ),

        new Padding(padding: const EdgeInsets.only(right: 20.0)),

    new Container(
    margin: const EdgeInsets.only(right: 0.0),
    child: userInfo.email!=null?_buildFollowerStat(userInfo):_buildFollowerStats(context),
    ),



      ],
    );
  }

  Widget _buildFollowerStats(BuildContext context) {
    return  new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new RaisedButton(
          child: Text(
            'SignUp',
            style: GoogleFonts.montserrat(color:Primary,fontSize: 18.0),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
              return  new SignUpPage();
            }));
          },

        ),
        new RaisedButton(
          child: Text(
            'Login',
            style: GoogleFonts.montserrat(color:Primary,fontSize: 18.0),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
              return  new LoginPage();
            }));
          },
          //shape: StadiumBorder(side: BorderSide()),
        ),
      ],
    );
  }

  Widget _buildFollowerStat( User userInfo) {

    return  new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(userInfo.name, style:  GoogleFonts.montserrat(color:Primary,fontSize: 18.0)),
            new Text(userInfo.email, style:  GoogleFonts.montserrat(color:Primary,fontSize: 18.0)),
          ],
        ),
          new IconButton(
              alignment:Alignment.centerRight,
              icon: new Icon(Icons.chevron_right, color: Colors.white70),
              onPressed: () {}),
        ]);
  }

  Widget _buildVerticalDivider() {
    return new Container(
      height: 30.0,
      width: 1.0,
      color: Colors.white30,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }




  @protected
  Widget renderMenu(BuildContext context, Store store) {
    return new Container(
      color: Colors.white,
      constraints: const BoxConstraints(maxHeight: 310.0),
      child: new ListView(
        padding: const EdgeInsets.only(left: 5.0),
        children: <Widget>[
          _buildListItem("Change password", Icons.lock_outline, () {}),
          Divider(),
          _buildListItem("Message",Icons.message, () {}),
          Divider(),
          _buildListItem("About us", Icons.info_outline, () {}),
          Divider(),
          _buildListItem("Share", Icons.share, () {}),
          Divider(),
          _buildListItem("Sign out", Icons.exit_to_app, () {
            UserDao.clearAll(store);
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData iconData, VoidCallback action) {
    final textStyle = new TextStyle(
        color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.w600);
    return new InkWell(
      onTap: action,
      child: new Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 0.0, top:0.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              alignment: Alignment.center,
              child: new Icon(iconData, color: Colors.black54, size: 24.0),
            ),
            new Text(title, style: GoogleFonts.montserrat(color:Primary,fontSize: 18.0)),
            new Expanded(child: new Container()),
            new IconButton(
                icon: new Icon(Icons.chevron_right, color: Colors.black26),
                onPressed: action)
          ],
        ),
      ),
    );
  }


}

class HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: paint background radial gradient
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}