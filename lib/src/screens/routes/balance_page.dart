import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/current_balance_block.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  FirebaseUser user;

  @override
  initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((FirebaseUser newUser) {
      user = newUser;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? LinearProgressIndicator()
        : StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("users/${user.uid}/transactions")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return LinearProgressIndicator();
              }

              var documents = snapshot.data.documents;
              return CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: CurrentBalanceBlock(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Your Recent Transactions:',
                          style: ThemeData.light().textTheme.display4.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, int index) {
                        return TransactionTile(
                            documentSnapshot: documents[index]);
                      },
                      childCount: documents.length,
                    ),
                  )
                ],
              );
            });
  }
}

class TransactionTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;

  const TransactionTile({Key key, this.documentSnapshot}) : super(key: key);
  int get amount => documentSnapshot.data['amount'];
  bool get isReceived => documentSnapshot.data["type"] == "received";
  String get otherPerson =>
      documentSnapshot.data[isReceived ? 'sender' : 'receiver']["token"]
          ["name"];
  String get tNo => documentSnapshot.documentID;

  @override
  Widget build(BuildContext context) {
    var transactionNumberStyle =
        ThemeData.light().textTheme.display4.copyWith(fontSize: 11);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListTile(
        title: Text('AMT: $amount'),
        isThreeLine: true,
        subtitle: Text('${isReceived ? "From" : "To"} : $otherPerson'),
        trailing: Text(
          'txn no:\n$tNo',
          style: transactionNumberStyle,
        ),
      ),
    );
  }
}
