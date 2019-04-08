import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  FirebaseUser user;

  @override
  initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((FirebaseUser newUser) {
      user = newUser;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? CircularProgressIndicator()
        : StreamBuilder(
            stream:
                Firestore.instance.document('users/${user.uid}').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot != null && snapshot.hasData) {
                return Center(
//                  child: Text('${snapshot.data.balance}'),
                  child: Text('${snapshot.data['balance']}'),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          );
  }
}
