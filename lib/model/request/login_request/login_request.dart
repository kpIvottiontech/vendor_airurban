/// emailAddress : "user@example.com"
/// password : "asdsadsad"

class LoginRequest {
  LoginRequest({
      String? emailAddress, 
      String? password,}){
    _emailAddress = emailAddress;
    _password = password;
}

  LoginRequest.fromJson(dynamic json) {
    _emailAddress = json['emailAddress'];
    _password = json['password'];
  }
  String? _emailAddress;
  String? _password;
LoginRequest copyWith({  String? emailAddress,
  String? password,
}) => LoginRequest(  emailAddress: emailAddress ?? _emailAddress,
  password: password ?? _password,
);
  String? get emailAddress => _emailAddress;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emailAddress'] = _emailAddress;
    map['password'] = _password;
    return map;
  }

}