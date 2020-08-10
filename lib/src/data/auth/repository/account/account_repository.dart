import 'package:rxdart/subjects.dart';
import 'package:simple_feed/src/data/auth/model/account.dart';

abstract class AccountRepository {
  Stream<AccountData> get accountStream;
  Future<bool> get hasAccount;
  Future<void> refreshAccountStream();
  Future<void> removeAccount();
}
