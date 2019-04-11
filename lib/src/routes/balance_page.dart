import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/blocs/current_balance_bloc.dart';

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
        : StreamBuilder<int>(
            stream: currentBalanceBlocSingleton.currentBalanceStream,
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot != null && snapshot.hasData) {
                return Center(
                  child: Text('${snapshot.data}'),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          );
  }
}
