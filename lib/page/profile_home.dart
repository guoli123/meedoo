import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/page/profile/main_menu.dart';
import 'package:gsy_github_app_flutter/page/profile/models.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_colors.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_icons.dart';
import 'package:gsy_github_app_flutter/page/profile/profile_header.dart';
import 'package:gsy_github_app_flutter/page/profile/quick_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gsy_github_app_flutter/redux/gsy_state.dart';
import 'package:redux/redux.dart';

class ProfileHomePage extends StatefulWidget {
  @override
  _ProfileHomePage createState() => _ProfileHomePage();
}

class _ProfileHomePage extends  BaseProfileState<ProfileHomePage> {



  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFFCCCCCC);
    final profile = getProfile();

    return new StoreBuilder<GSYState>(
      builder: (context, store) {
        return new Scaffold(
          body: new ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              renderItem(context,profile,store.state.userInfo),
              new QuickActions(),
              renderMenu(context,store),

            ],
          ),

        );
      },
    );


  }
}