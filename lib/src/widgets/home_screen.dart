import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_banking_system/src/widgets/balance_page.dart';
import 'package:mobile_banking_system/src/widgets/selections_column.dart';
import 'package:mobile_banking_system/src/widgets/transfer_funds_page.dart';
import 'package:mobile_banking_system/src/widgets/user_column.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          elevation: 10.0,
          child: Column(
            children: <Widget>[
              UserDisplayColumn(
                user: widget.user,
              ),
              SelectionsColumn(controller: tabController),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blue[900]),
          title: Text(
            screenName,
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.googleSignIn.disconnect();
                FirebaseAuth.instance.signOut();
                widget.googleSignIn.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Sign Out'),
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
