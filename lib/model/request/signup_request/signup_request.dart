/// name : "umesh"
/// businessName : "sadasdsad"
/// phone : "1416322405"
/// emailAddress : "user3@example.com"
/// bankName : "string"
/// accountNumber : "string"
/// bsb : "string"
/// accountName : "string"
/// password : "Test@123"
/// drivingLicense : "string"
/// passportNumber : "string"
/// categoryId : 12

class SignupRequest {
  SignupRequest({
      String? name, 
      String? businessName, 
      String? phone, 
      String? emailAddress, 
      String? bankName, 
      String? accountNumber, 
      String? bsb, 
      String? accountName, 
      String? password, 
      String? drivingLicense, 
      String? passportNumber, 
      num? categoryId,}){
    _name = name;
    _businessName = businessName;
    _phone = phone;
    _emailAddress = emailAddress;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _bsb = bsb;
    _accountName = accountName;
    _password = password;
    _drivingLicense = drivingLicense;
    _passportNumber = passportNumber;
    _categoryId = categoryId;
}

  SignupRequest.fromJson(dynamic json) {
    _name = json['name'];
    _businessName = json['businessName'];
    _phone = json['phone'];
    _emailAddress = json['emailAddress'];
    _bankName = json['bankName'];
    _accountNumber = json['accountNumber'];
    _bsb = json['bsb'];
    _accountName = json['accountName'];
    _password = json['password'];
    _drivingLicense = json['drivingLicense'];
    _passportNumber = json['passportNumber'];
    _categoryId = json['categoryId'];
  }
  String? _name;
  String? _businessName;
  String? _phone;
  String? _emailAddress;
  String? _bankName;
  String? _accountNumber;
  String? _bsb;
  String? _accountName;
  String? _password;
  String? _drivingLicense;
  String? _passportNumber;
  num? _categoryId;
SignupRequest copyWith({  String? name,
  String? businessName,
  String? phone,
  String? emailAddress,
  String? bankName,
  String? accountNumber,
  String? bsb,
  String? accountName,
  String? password,
  String? drivingLicense,
  String? passportNumber,
  num? categoryId,
}) => SignupRequest(  name: name ?? _name,
  businessName: businessName ?? _businessName,
  phone: phone ?? _phone,
  emailAddress: emailAddress ?? _emailAddress,
  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  bsb: bsb ?? _bsb,
  accountName: accountName ?? _accountName,
  password: password ?? _password,
  drivingLicense: drivingLicense ?? _drivingLicense,
  passportNumber: passportNumber ?? _passportNumber,
  categoryId: categoryId ?? _categoryId,
);
  String? get name => _name;
  String? get businessName => _businessName;
  String? get phone => _phone;
  String? get emailAddress => _emailAddress;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get bsb => _bsb;
  String? get accountName => _accountName;
  String? get password => _password;
  String? get drivingLicense => _drivingLicense;
  String? get passportNumber => _passportNumber;
  num? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['businessName'] = _businessName;
    map['phone'] = _phone;
    map['emailAddress'] = _emailAddress;
    map['bankName'] = _bankName;
    map['accountNumber'] = _accountNumber;
    map['bsb'] = _bsb;
    map['accountName'] = _accountName;
    map['password'] = _password;
    map['drivingLicense'] = _drivingLicense;
    map['passportNumber'] = _passportNumber;
    map['categoryId'] = _categoryId;
    return map;
  }

}