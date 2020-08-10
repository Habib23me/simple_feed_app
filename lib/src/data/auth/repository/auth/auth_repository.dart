import 'package:simple_feed/src/data/auth/model/verify_account.dart';

abstract class AuthRepository {
  Future<void> signIn(VerifyAccountPayload payload);
  Future<void> signOut();
}
