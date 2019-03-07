import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/widgets/balance_page.dart';
import 'package:mobile_banking_system/src/widgets/statement_page.dart';
import 'package:mobile_banking_system/src/widgets/support_page.dart';
import 'package:mobile_banking_system/src/widgets/transfer_funds_page.dart';

var iconColor = Colors.blue[900];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  //following screens are being built
  // Balance and Payments
  // Fund Transfer
  // Support
  // Statement Export

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  ListTile generateListTile(IconData icon, String label, int pageNumber) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0).copyWith(left: 10.0),
      leading: Icon(
        icon,
        size: 50.0,
        color: iconColor,
      ),
      title: Text(label),
      onTap: () {
        tabController.animateTo(
          pageNumber,
          duration: Duration(milliseconds: 100),
        );
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("BACK"),
              backgroundColor: Colors.blue[900],
            ),
            generateListTile(Icons.account_balance, "BALANCE", 0),
            generateListTile(Icons.compare_arrows, "TRANSFER FUNDS", 1),
            generateListTile(Icons.list, "STATEMENT", 2),
            generateListTile(Icons.contact_phone, "SUPPORT", 3),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blue[900]),
        title: Text(
          "My Mobile Bank",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          BalancePage(),
          TransferFundsPage(),
          StatementPage(),
          SupportPage(),
        ],
        controller: tabController,
      ),
    );
  }
}
