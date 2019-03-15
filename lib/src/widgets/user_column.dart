import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDisplayColumn extends StatelessWidget {
  final FirebaseUser user;

  const UserDisplayColumn({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(child: Image.network(user.photoUrl ?? '')),
        Text(user.displayName ?? ''),
        Text("1234567890" ?? ''),
        Text("MMBA2019" ?? ''),
        Text(user.email ?? ''),
        Text(user.phoneNumber ?? ''),
      ],
    );
  }
}
