import 'package:flutter/material.dart';

var iconColor = Colors.blue[900];

class SelectionsColumn extends StatelessWidget {
  final TabController controller;

  const SelectionsColumn({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile generateListTile(
      IconData icon,
      String label,
      int pageNumber,
    ) {
      return ListTile(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0).copyWith(left: 10.0),
        leading: Icon(
          icon,
          size: 50.0,
          color: iconColor,
        ),
        title: Text(label),
        onTap: () {
          controller.animateTo(
            pageNumber,
            duration: Duration(milliseconds: 100),
          );
          Navigator.pop(context, label);
        },
      );
    }

    return Column(
      children: <Widget>[
        generateListTile(Icons.book, "PASSBOOK", 0),
        generateListTile(Icons.compare_arrows, "TRANSFER", 1),
      ],
    );
  }
}
