class AccountData {
  final String token;
  final String uid;

  AccountData({this.token, this.uid});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountData && o.token == token && o.uid == uid;
  }

  @override
  int get hashCode => token.hashCode ^ uid.hashCode;

  @override
  String toString() => 'AccountData(token: $token, uid: $uid)';
}
