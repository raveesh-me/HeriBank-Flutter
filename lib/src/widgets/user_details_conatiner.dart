import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

double radius = 20;

class UserDisplayContainer extends StatelessWidget {
  final FirebaseUser user;

  const UserDisplayContainer({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl),
                radius: width * 0.25,
              ),
              Text(
                user.displayName ?? '',
                style: textTheme.display1,
              ),
              Text(
                user.email ?? '',
                style: textTheme.caption,
              ),
              Text(
                user.phoneNumber ?? '',
                style: textTheme.caption,
              ),
              Text(
                "A/c no: 1234567890" ?? '',
                style: textTheme.display3.copyWith(fontSize: 20),
              ),
              Text(
                "IFSC Code: MMBA2019" ?? '',
                style: textTheme.display3.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
