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
    TextStyle yourAccountBalanceTextStyle =
        ThemeData.light().textTheme.display4.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            );
    TextStyle balanceTextStyle = ThemeData.light().textTheme.display4.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 25,
        );

    String getMoneyInRupees(int moneyInPaise) =>
        'INR ${(moneyInPaise / 100).toStringAsFixed(2)}';

    return user == null
        ? CircularProgressIndicator()
        : StreamBuilder<int>(
            stream: currentBalanceBlocSingleton.currentBalanceStream,
            builder: (context, AsyncSnapshot<int> snapshot) {
              if (snapshot != null && snapshot.hasData) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Your Account Balance Is: ',
                            style: yourAccountBalanceTextStyle,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            getMoneyInRupees(snapshot.data),
                            style: balanceTextStyle,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Your recent transactions: ',
                            style: yourAccountBalanceTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SliverList(delegate: SliverChildBuilderDelegate((context, position){
                      var transactionNumberStyle = ThemeData.light().textTheme.display4.copyWith(fontSize: 11);
                      return Center(
                        child: ListTile(
                          title: Text('AMT: 300'),
                          isThreeLine: true,
                          subtitle: Text('From: Raveesh Agarwal (rishu)'),
                          trailing: Text('txn no:\n456987458965412563', style: transactionNumberStyle,),
                        ),
                      );
                    }))
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          );
  }
}
