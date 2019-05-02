import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/blocs/current_balance_bloc.dart';

class CurrentBalanceBlock extends StatelessWidget {
  CurrentBalanceBlock.white() : baseTheme = ThemeData.dark();
  CurrentBalanceBlock() : baseTheme = ThemeData.light();

  final ThemeData baseTheme;

  @override
  Widget build(BuildContext context) {
    TextStyle yourAccountBalanceTextStyle =
        baseTheme.textTheme.display4.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 15,
    );
    TextStyle balanceTextStyle = baseTheme.textTheme.display4.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 25,
    );

    String getMoneyInRupees(int moneyInPaise) =>
        'INR ${(moneyInPaise / 100).toStringAsFixed(2)}';

    return StreamBuilder<int>(
      stream: currentBalanceBlocSingleton.currentBalanceStream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot != null && snapshot.hasData) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'Your Account Balance Is: ',
                style: yourAccountBalanceTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                getMoneyInRupees(snapshot.data),
                style: balanceTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
