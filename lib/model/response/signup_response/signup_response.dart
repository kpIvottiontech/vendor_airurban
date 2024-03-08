/// responseType : "Success"
/// responseMessage : "Account Registered Successfully, Contact to admin for verify and login"
/// returnId : 18
/// returnValue : ""
/// responseObject : {"vendorId":18,"name":"umesh","businessName":"sadasdsad","phone":"1416322405","emailAddress":"user3@example.com","bankName":"string","accountNumber":"string","bsb":"string","accountName":"string","password":"Test@123","profileImage":"https://airurbanweb.ivotiontech.co.in/assets/img/testimonials-1.jpg","drivingLicense":"string","passportNumber":"string","status":"Pending","address":null,"createdDate":"2024-01-17T13:11:24.8077642+05:30","createdBy":0,"categoryId":12,"deactivateDate":null,"deactivateBy":null,"rejectedReason":null,"aboutUs":null}
/// error : ""

class SignupResponse {
  SignupResponse({
      String? responseType, 
      String? responseMessage, 
      num? returnId, 
      String? returnValue, 
      ResponseObject? responseObject, 
      String? error,}){
    _responseType = responseType;
    _responseMessage = responseMessage;
    _returnId = returnId;
    _returnValue = returnValue;
    _responseObject = responseObject;
    _error = error;
}

  SignupResponse.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseMessage = json['responseMessage'];
    _returnId = json['returnId'];
    _returnValue = json['returnValue'];
    _responseObject = json['responseObject'] != null ? ResponseObject.fromJson(json['responseObject']) : null;
    _error = json['error'];
  }
  String? _responseType;
  String? _responseMessage;
  num? _returnId;
  String? _returnValue;
  ResponseObject? _responseObject;
  String? _error;
SignupResponse copyWith({  String? responseType,
  String? responseMessage,
  num? returnId,
  String? returnValue,
  ResponseObject? responseObject,
  String? error,
}) => SignupResponse(  responseType: responseType ?? _responseType,
  responseMessage: responseMessage ?? _responseMessage,
  returnId: returnId ?? _returnId,
  returnValue: returnValue ?? _returnValue,
  responseObject: responseObject ?? _responseObject,
  error: error ?? _error,
);
  String? get responseType => _responseType;
  String? get responseMessage => _responseMessage;
  num? get returnId => _returnId;
  String? get returnValue => _returnValue;
  ResponseObject? get responseObject => _responseObject;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    map['responseMessage'] = _responseMessage;
    map['returnId'] = _returnId;
    map['returnValue'] = _returnValue;
    if (_responseObject != null) {
      map['responseObject'] = _responseObject?.toJson();
    }
    map['error'] = _error;
    return map;
  }

}

/// vendorId : 18
/// name : "umesh"
/// businessName : "sadasdsad"
/// phone : "1416322405"
/// emailAddress : "user3@example.com"
/// bankName : "string"
/// accountNumber : "string"
/// bsb : "string"
/// accountName : "string"
/// password : "Test@123"
/// profileImage : "https://airurbanweb.ivotiontech.co.in/assets/img/testimonials-1.jpg"
/// drivingLicense : "string"
/// passportNumber : "string"
/// status : "Pending"
/// address : null
/// createdDate : "2024-01-17T13:11:24.8077642+05:30"
/// createdBy : 0
/// categoryId : 12
/// deactivateDate : null
/// deactivateBy : null
/// rejectedReason : null
/// aboutUs : null

class ResponseObject {
  ResponseObject({
      num? vendorId, 
      String? name, 
      String? businessName, 
      String? phone, 
      String? emailAddress, 
      String? bankName, 
      String? accountNumber, 
      String? bsb, 
      String? accountName, 
      String? password, 
      String? profileImage, 
      String? drivingLicense, 
      String? passportNumber, 
      String? status, 
      dynamic address, 
      String? createdDate, 
      num? createdBy, 
      num? categoryId, 
      dynamic deactivateDate, 
      dynamic deactivateBy, 
      dynamic rejectedReason, 
      dynamic aboutUs,}){
    _vendorId = vendorId;
    _name = name;
    _businessName = businessName;
    _phone = phone;
    _emailAddress = emailAddress;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _bsb = bsb;
    _accountName = accountName;
    _password = password;
    _profileImage = profileImage;
    _drivingLicense = drivingLicense;
    _passportNumber = passportNumber;
    _status = status;
    _address = address;
    _createdDate = createdDate;
    _createdBy = createdBy;
    _categoryId = categoryId;
    _deactivateDate = deactivateDate;
    _deactivateBy = deactivateBy;
    _rejectedReason = rejectedReason;
    _aboutUs = aboutUs;
}

  ResponseObject.fromJson(dynamic json) {
    _vendorId = json['vendorId'];
    _name = json['name'];
    _businessName = json['businessName'];
    _phone = json['phone'];
    _emailAddress = json['emailAddress'];
    _bankName = json['bankName'];
    _accountNumber = json['accountNumber'];
    _bsb = json['bsb'];
    _accountName = json['accountName'];
    _password = json['password'];
    _profileImage = json['profileImage'];
    _drivingLicense = json['drivingLicense'];
    _passportNumber = json['passportNumber'];
    _status = json['status'];
    _address = json['address'];
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _categoryId = json['categoryId'];
    _deactivateDate = json['deactivateDate'];
    _deactivateBy = json['deactivateBy'];
    _rejectedReason = json['rejectedReason'];
    _aboutUs = json['aboutUs'];
  }
  num? _vendorId;
  String? _name;
  String? _businessName;
  String? _phone;
  String? _emailAddress;
  String? _bankName;
  String? _accountNumber;
  String? _bsb;
  String? _accountName;
  String? _password;
  String? _profileImage;
  String? _drivingLicense;
  String? _passportNumber;
  String? _status;
  dynamic _address;
  String? _createdDate;
  num? _createdBy;
  num? _categoryId;
  dynamic _deactivateDate;
  dynamic _deactivateBy;
  dynamic _rejectedReason;
  dynamic _aboutUs;
ResponseObject copyWith({  num? vendorId,
  String? name,
  String? businessName,
  String? phone,
  String? emailAddress,
  String? bankName,
  String? accountNumber,
  String? bsb,
  String? accountName,
  String? password,
  String? profileImage,
  String? drivingLicense,
  String? passportNumber,
  String? status,
  dynamic address,
  String? createdDate,
  num? createdBy,
  num? categoryId,
  dynamic deactivateDate,
  dynamic deactivateBy,
  dynamic rejectedReason,
  dynamic aboutUs,
}) => ResponseObject(  vendorId: vendorId ?? _vendorId,
  name: name ?? _name,
  businessName: businessName ?? _businessName,
  phone: phone ?? _phone,
  emailAddress: emailAddress ?? _emailAddress,
  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  bsb: bsb ?? _bsb,
  accountName: accountName ?? _accountName,
  password: password ?? _password,
  profileImage: profileImage ?? _profileImage,
  drivingLicense: drivingLicense ?? _drivingLicense,
  passportNumber: passportNumber ?? _passportNumber,
  status: status ?? _status,
  address: address ?? _address,
  createdDate: createdDate ?? _createdDate,
  createdBy: createdBy ?? _createdBy,
  categoryId: categoryId ?? _categoryId,
  deactivateDate: deactivateDate ?? _deactivateDate,
  deactivateBy: deactivateBy ?? _deactivateBy,
  rejectedReason: rejectedReason ?? _rejectedReason,
  aboutUs: aboutUs ?? _aboutUs,
);
  num? get vendorId => _vendorId;
  String? get name => _name;
  String? get businessName => _businessName;
  String? get phone => _phone;
  String? get emailAddress => _emailAddress;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get bsb => _bsb;
  String? get accountName => _accountName;
  String? get password => _password;
  String? get profileImage => _profileImage;
  String? get drivingLicense => _drivingLicense;
  String? get passportNumber => _passportNumber;
  String? get status => _status;
  dynamic get address => _address;
  String? get createdDate => _createdDate;
  num? get createdBy => _createdBy;
  num? get categoryId => _categoryId;
  dynamic get deactivateDate => _deactivateDate;
  dynamic get deactivateBy => _deactivateBy;
  dynamic get rejectedReason => _rejectedReason;
  dynamic get aboutUs => _aboutUs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vendorId'] = _vendorId;
    map['name'] = _name;
    map['businessName'] = _businessName;
    map['phone'] = _phone;
    map['emailAddress'] = _emailAddress;
    map['bankName'] = _bankName;
    map['accountNumber'] = _accountNumber;
    map['bsb'] = _bsb;
    map['accountName'] = _accountName;
    map['password'] = _password;
    map['profileImage'] = _profileImage;
    map['drivingLicense'] = _drivingLicense;
    map['passportNumber'] = _passportNumber;
    map['status'] = _status;
    map['address'] = _address;
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['categoryId'] = _categoryId;
    map['deactivateDate'] = _deactivateDate;
    map['deactivateBy'] = _deactivateBy;
    map['rejectedReason'] = _rejectedReason;
    map['aboutUs'] = _aboutUs;
    return map;
  }

}