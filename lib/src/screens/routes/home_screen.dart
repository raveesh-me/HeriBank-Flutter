import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_banking_system/src/blocs/current_balance_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_banking_system/src/screens/app_drawer/app_drawer.dart';
import 'package:mobile_banking_system/src/screens/routes/balance_page.dart';
import 'package:mobile_banking_system/src/screens/routes/transfer_funds/transfer_funds_page.dart';

class HomeScreen extends StatefulWidget {
  final GoogleSignIn googleSignIn;
  final FirebaseUser user;

  const HomeScreen({
    Key key,
    @required this.googleSignIn,
    @required this.user,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  String screenName = "My Mobile Banking App";

  //following screens are being built
  // Balance and Payments
  // Fund Transfer
  // Support
  // Statement Export

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    currentBalanceBlocSingleton.init(Firestore.instance, widget.user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(
          user: widget.user,
          controller: tabController,
        ),
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            screenName,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.white,
                onPressed: () {
                  widget.googleSignIn.disconnect();
                  FirebaseAuth.instance.signOut();
                  widget.googleSignIn.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                ),
                label: Text(
                  'Sign Out',
                ),
              ),
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            BalancePage(),
            TransferFundsPage(),
          ],
          controller: tabController,
        ),
      ),
    );
  }
}
