import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_feed/src/data/auth/model/account.dart';
import 'package:simple_feed/src/data/auth/repository/account/account_repository.dart';

class FirebaseAccountRepository implements AccountRepository {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  @override
  BehaviorSubject<AccountData> get accountStream =>
      BehaviorSubject<AccountData>()
        ..addStream(
          _firebaseAuth.onAuthStateChanged.asyncMap(mapAuthState),
        );

  Future<AccountData> mapAuthState(FirebaseUser user) async {
    if (user == null) {
      return null;
    }
    var idToken = await user.getIdToken();
    return AccountData(token: idToken.token, uid: user.uid);
  }

  @override
  Future<void> refreshAccountStream() async {
    var user = await _firebaseAuth.currentUser();
    var account = await mapAuthState(user);
    accountStream.add(account);
  }

  @override
  Future<void> removeAccount() => _firebaseAuth.signOut();

  @override
  Future<bool> get hasAccount async =>
      (await _firebaseAuth.currentUser()) != null;
}
