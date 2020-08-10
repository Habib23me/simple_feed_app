class VerifyAccountPayload {
  final String phoneNumber;

  VerifyAccountPayload({
    this.phoneNumber,
  });

  VerifyAccountPayload copyWith({
    String phoneNumber,
  }) {
    return VerifyAccountPayload(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
    };
  }

  @override
  String toString() => 'VerifyAccountPayload(phoneNumber: $phoneNumber)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VerifyAccountPayload && o.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode => phoneNumber.hashCode;
}
