import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/app_drawer/selections_column.dart';
import 'package:mobile_banking_system/src/app_drawer/support_box.dart';
import 'package:mobile_banking_system/src/app_drawer/user_details_conatiner.dart';

class AppDrawer extends StatefulWidget {
  final FirebaseUser user;
  final TabController controller;

  const AppDrawer({
    Key key,
    @required this.user,
    @required this.controller,
  }) : super(key: key);

  @override
  AppDrawerState createState() {
    return new AppDrawerState();
  }
}

class AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    UserDisplayContainer(
                      user: widget.user,
                    ),
                    SelectionsColumn(controller: widget.controller),
                  ],
                ),
              ),
            ),
            SupportBox(),
          ],
        ),
      ),
    );
  }
}
