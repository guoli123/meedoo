import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsy_github_app_flutter/page/profile/colors.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          _buildListItem("Sign out", Icons.exit_to_app, () {}),
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