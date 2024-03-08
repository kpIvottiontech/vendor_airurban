/// responseType : "Success"
/// responseMessage : "Success"
/// returnId : 14
/// returnValue : ""
/// responseObject : {"vendorId":14,"name":"name","businessName":"business name","phone":"1234567890","emailAddress":"umesh@ivotiontech.com","bankName":"us bank","accountNumber":"11223344556677675676574389878777783333333333333333333333333333333333333347764726872","bsb":"bsb","accountName":"qwerty hdhgasuycguycgugyugcgasygcygausgcyagygcyegftyutgyygaghccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccyuedgygyudgcaucggyuagggggggggggggggggggggggggchsdcayc","password":"123456789","profileImage":"http://airurbanweb.ivotiontech.co.in/assets/img/testimonials-1.jpg","drivingLicense":"driving license","passportNumber":"passport number","status":"Approved","createdDate":"0001-01-01T00:00:00","createdBy":0,"categoryId":8,"deactivateDate":null,"deactivateBy":null,"rejectedReason":null}
/// error : ""

class LoginResponse {
  LoginResponse({
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

  LoginResponse.fromJson(dynamic json) {
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
LoginResponse copyWith({  String? responseType,
  String? responseMessage,
  num? returnId,
  String? returnValue,
  ResponseObject? responseObject,
  String? error,
}) => LoginResponse(  responseType: responseType ?? _responseType,
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

/// vendorId : 14
/// name : "name"
/// businessName : "business name"
/// phone : "1234567890"
/// emailAddress : "umesh@ivotiontech.com"
/// bankName : "us bank"
/// accountNumber : "11223344556677675676574389878777783333333333333333333333333333333333333347764726872"
/// bsb : "bsb"
/// accountName : "qwerty hdhgasuycguycgugyugcgasygcygausgcyagygcyegftyutgyygaghccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccyuedgygyudgcaucggyuagggggggggggggggggggggggggchsdcayc"
/// password : "123456789"
/// profileImage : "http://airurbanweb.ivotiontech.co.in/assets/img/testimonials-1.jpg"
/// drivingLicense : "driving license"
/// passportNumber : "passport number"
/// status : "Approved"
/// createdDate : "0001-01-01T00:00:00"
/// createdBy : 0
/// categoryId : 8
/// deactivateDate : null
/// deactivateBy : null
/// rejectedReason : null

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
      String? createdDate, 
      num? createdBy, 
      num? categoryId, 
      dynamic deactivateDate, 
      dynamic deactivateBy, 
      dynamic rejectedReason,}){
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
    _createdDate = createdDate;
    _createdBy = createdBy;
    _categoryId = categoryId;
    _deactivateDate = deactivateDate;
    _deactivateBy = deactivateBy;
    _rejectedReason = rejectedReason;
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
    _createdDate = json['createdDate'];
    _createdBy = json['createdBy'];
    _categoryId = json['categoryId'];
    _deactivateDate = json['deactivateDate'];
    _deactivateBy = json['deactivateBy'];
    _rejectedReason = json['rejectedReason'];
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
  String? _createdDate;
  num? _createdBy;
  num? _categoryId;
  dynamic _deactivateDate;
  dynamic _deactivateBy;
  dynamic _rejectedReason;
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
  String? createdDate,
  num? createdBy,
  num? categoryId,
  dynamic deactivateDate,
  dynamic deactivateBy,
  dynamic rejectedReason,
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
  createdDate: createdDate ?? _createdDate,
  createdBy: createdBy ?? _createdBy,
  categoryId: categoryId ?? _categoryId,
  deactivateDate: deactivateDate ?? _deactivateDate,
  deactivateBy: deactivateBy ?? _deactivateBy,
  rejectedReason: rejectedReason ?? _rejectedReason,
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
  String? get createdDate => _createdDate;
  num? get createdBy => _createdBy;
  num? get categoryId => _categoryId;
  dynamic get deactivateDate => _deactivateDate;
  dynamic get deactivateBy => _deactivateBy;
  dynamic get rejectedReason => _rejectedReason;

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
    map['createdDate'] = _createdDate;
    map['createdBy'] = _createdBy;
    map['categoryId'] = _categoryId;
    map['deactivateDate'] = _deactivateDate;
    map['deactivateBy'] = _deactivateBy;
    map['rejectedReason'] = _rejectedReason;
    return map;
  }

}