import 'package:flutter/material.dart';

var iconColor = Colors.white;

class SelectionsColumn extends StatelessWidget {
  final TabController controller;

  const SelectionsColumn({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget generateListTile(IconData icon, String label, int pageNumber) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blue[600],
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              spreadRadius: 2,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0).copyWith(left: 10.0),
          leading: Icon(
            icon,
            size: 50.0,
            color: iconColor,
          ),
          title: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () {
            controller.animateTo(
              pageNumber,
              duration: Duration(milliseconds: 100),
            );
            Navigator.pop(context, label);
          },
        ),
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
