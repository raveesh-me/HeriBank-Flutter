import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

CurrentBalanceBloc currentBalanceBlocSingleton = CurrentBalanceBloc();

class CurrentBalanceBloc {
  BehaviorSubject<int> currentBalanceStream = BehaviorSubject<int>();

  init(Firestore firestoreInstance, String uid) {
    print('BALANCE BLOC: $uid');
    firestoreInstance.document('users/$uid').snapshots().listen(
      (DocumentSnapshot userSnapshot) {
        currentBalanceStream.add(userSnapshot.data['balance']);
      },
    );
  }

  dispose() {
    currentBalanceStream.close();
  }
}
