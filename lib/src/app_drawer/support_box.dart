import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color iconColor = Colors.white;
const TextStyle supportBoxContentStyle = TextStyle(
  color: iconColor,
);
const String PHONE_NUMBER = '+91 8017348013';
const String EMAIL_ADDRESS = 'masanta.ragini@gmail.com';

class SupportBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[400],
      elevation: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            'Support:',
            style: supportBoxContentStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () async {
              if (await canLaunch('tel:' + PHONE_NUMBER)) {
                await launch('tel:' + PHONE_NUMBER);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.call, color: iconColor),
                Text(
                  ' $PHONE_NUMBER',
                  style: supportBoxContentStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () async {
              if (await canLaunch('mailto:' + PHONE_NUMBER)) {
                await launch('mailto:' + PHONE_NUMBER);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.email, color: iconColor),
                Text(
                  ' $EMAIL_ADDRESS',
                  style: supportBoxContentStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
