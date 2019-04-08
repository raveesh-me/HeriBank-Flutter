import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class TransferFundsPage extends StatefulWidget {
  @override
  _TransferFundsPageState createState() => _TransferFundsPageState();
}

class _TransferFundsPageState extends State<TransferFundsPage> {
  String token;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(visible: token != null, child: Text('token: $token')),
        RaisedButton(
          onPressed: () async {
            try {
              dynamic result = await CloudFunctions.instance.call(
                functionName: 'generateToken',
                parameters: {
                  "amount": 210,
                  'secret_pin': '112233'
                },
              );
              print(result);
              setState(() {
                token = result['data'];
              });
            } catch (error) {
              setState(() {
                token = error.toString();
              });
              print(error.message);
              return;
            }
          },
          child: Text("Generate Token"),
        ),
      ],
    );
  }
}
