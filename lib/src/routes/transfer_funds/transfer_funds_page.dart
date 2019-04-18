import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:mobile_banking_system/src/routes/transfer_funds/generate_token_page.dart';
import 'package:mobile_banking_system/src/routes/transfer_funds/redeem_token_page.dart';

class TransferFundsPage extends StatefulWidget {
  @override
  _TransferFundsPageState createState() => _TransferFundsPageState();
}

class _TransferFundsPageState extends State<TransferFundsPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: TabBar(
          controller: _tabController,
          tabs: [
            Icon(Icons.flight_takeoff,color: Colors.blue,),
            Icon(Icons.flight_land, color: Colors.blue,),
          ],
        ), preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GenerateTokenPage(),
          RedeemTokenPage(),
        ],
      ),
    );
  }
}
