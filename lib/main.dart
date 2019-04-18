import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_banking_system/src/routes/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  FirebaseUser user;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;

  loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    user = await _auth.signInWithCredential(credential);

    print("signed in " + user.displayName);
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _auth.signOut();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue[600],
      ),
      home: StreamBuilder<FirebaseUser>(
        stream: _auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(
              googleSignIn: _googleSignIn,
              user: snapshot.data,
            );
          } else {
            return LoginScreen(login: loginWithGoogle);
          }
        },
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final Function login;

  const LoginScreen({Key key, @required this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: login,
            iconSize: 60.0,
          ),
        ),
      ),
    );
  }
}
