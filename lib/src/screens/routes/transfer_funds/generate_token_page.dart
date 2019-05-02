import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class GenerateTokenPage extends StatefulWidget {
  @override
  _GenerateTokenPageState createState() => _GenerateTokenPageState();
}

class _GenerateTokenPageState extends State<GenerateTokenPage> {

  String token;

  TextEditingController secretPinController;
  TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    secretPinController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              labelText: 'Enter amount in paise',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: secretPinController,
            decoration: InputDecoration(
              labelText: 'Enter Secret Pin',
              border: OutlineInputBorder(),
            ),
          ),
          Visibility(visible: token != null, child: Text('token: $token')),
          SizedBox(height: 10,),
          RaisedButton(
            onPressed: () async {
              setState(() {
                token = 'loading...';
              });
              try {
                dynamic result = await CloudFunctions.instance.call(
                  functionName: 'generateToken',
                  parameters: {
                    "amount": int.parse(amountController.value.text),
                    'secret_pin': secretPinController.value.text,
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
            child: Text("Generate Token"),
          ),
        ],
      ),
    );
  }
}
