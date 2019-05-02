import 'package:flutter/material.dart';
import 'package:mobile_banking_system/src/screens/routes/transfer_funds/generate_token_page.dart';
import 'package:mobile_banking_system/src/screens/routes/transfer_funds/redeem_token_page.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.send, color: Colors.grey[300], size: 30, ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.call_received, color: Colors.grey[300], size: 30,),
            ),
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
