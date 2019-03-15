import 'package:flutter/material.dart';

const Color iconColor = Colors.white;
const TextStyle supportBoxContentStyle = TextStyle(
  color: iconColor,
);

class SupportBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Support:',
          style: supportBoxContentStyle,
        ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            //TODO:Find a way to make a call
            print('jj');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.call, color: iconColor),
              Text(
                ' 9000000001',
                style: supportBoxContentStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            //TODO:Find a way to mail
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.alternate_email, color: iconColor),
              Text(
                ' email@email.com',
                style: supportBoxContentStyle,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
