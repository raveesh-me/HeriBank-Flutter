import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/current_balance_block.dart';

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
        : Column(
            children: <Widget>[CurrentBalanceBlock()],
          );
  }
}

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transactionNumberStyle =
        ThemeData.light().textTheme.display4.copyWith(fontSize: 11);
    return ListView(
      children: <Widget>[
        Center(
          child: ListTile(
            title: Text('AMT: 300'),
            isThreeLine: true,
            subtitle: Text('From: Raveesh Agarwal (rishu)'),
            trailing: Text(
              'txn no:\n456987458965412563',
              style: transactionNumberStyle,
            ),
          ),
        ),
      ],
    );
  }
}
