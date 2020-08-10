import 'package:meta/meta.dart';

import 'package:simple_feed/src/data/auth/model/verify_account.dart';
import 'package:simple_feed/src/data/auth/repository/auth/auth_repository.dart';
import 'package:simple_feed/src/util/http_client/http_client.dart';

class AuthApiRepository extends AuthRepository {
  static const signInPath = "/accounts/signIn";
  static const signOutPath = "/accounts/signOut";

  final HttpClient _httpClient;

  AuthApiRepository({@required HttpClient httpClient})
      : assert(httpClient != null),
        _httpClient = httpClient;

  @override
  Future<void> signIn(VerifyAccountPayload payload) {
    return _httpClient.post(
      signInPath,
      data: payload.toJson(),
    );
  }

  @override
  Future<void> signOut() async {
    return _httpClient.post(signOutPath);
  }
}
