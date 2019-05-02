import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class RedeemTokenPage extends StatefulWidget {
  @override
  _RedeemTokenPageState createState() => _RedeemTokenPageState();
}

class _RedeemTokenPageState extends State<RedeemTokenPage> {
  TextEditingController tokenController;

  String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokenController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: tokenController,
            decoration: InputDecoration(
              labelText: 'Enter your token here',
              border: OutlineInputBorder(),
            ),
            textCapitalization: TextCapitalization.characters,
          ),
          Visibility(visible: token != null, child: Text('token: $token')),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () async {
              setState(() {
                token = 'redeeming...';
              });
              try {
                dynamic result = await CloudFunctions.instance.call(
                  functionName: 'redeemToken',
                  parameters: {
                    'token': tokenController.value.text,
                  },
                );
                print(result);
                setState(() {
//                token = result['data'];
                  token = '$result';
                });
              } catch (error) {
                setState(() {
                  token = error.toString();
                });
                print(error.message);
                return;
              }
            },
            child: Text("Redeem Token"),
          ),
        ],
      ),
    );
  }
}
