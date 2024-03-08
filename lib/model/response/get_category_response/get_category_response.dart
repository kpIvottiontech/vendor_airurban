/// responseType : "Success"
/// responseMessage : ""
/// returnId : 0
/// returnValue : ""
/// responseObject : [{"categoryid":8,"name":"Air Care"},{"categoryid":9,"name":"Air Event"},{"categoryid":10,"name":"Air Trade"},{"categoryid":11,"name":"Air Clean"}]
/// error : ""

class GetCategoryResponse {
  GetCategoryResponse({
      String? responseType, 
      String? responseMessage, 
      num? returnId, 
      String? returnValue, 
      List<GetCategoryData>? responseObject,
      String? error,}){
    _responseType = responseType;
    _responseMessage = responseMessage;
    _returnId = returnId;
    _returnValue = returnValue;
    _responseObject = responseObject;
    _error = error;
}

  GetCategoryResponse.fromJson(dynamic json) {
    _responseType = json['responseType'];
    _responseMessage = json['responseMessage'];
    _returnId = json['returnId'];
    _returnValue = json['returnValue'];
    if (json['responseObject'] != null) {
      _responseObject = [];
      json['responseObject'].forEach((v) {
        _responseObject?.add(GetCategoryData.fromJson(v));
      });
    }
    _error = json['error'];
  }
  String? _responseType;
  String? _responseMessage;
  num? _returnId;
  String? _returnValue;
  List<GetCategoryData>? _responseObject;
  String? _error;
GetCategoryResponse copyWith({  String? responseType,
  String? responseMessage,
  num? returnId,
  String? returnValue,
  List<GetCategoryData>? responseObject,
  String? error,
}) => GetCategoryResponse(  responseType: responseType ?? _responseType,
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
  List<GetCategoryData>? get responseObject => _responseObject;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseType'] = _responseType;
    map['responseMessage'] = _responseMessage;
    map['returnId'] = _returnId;
    map['returnValue'] = _returnValue;
    if (_responseObject != null) {
      map['responseObject'] = _responseObject?.map((v) => v.toJson()).toList();
    }
    map['error'] = _error;
    return map;
  }

}

/// categoryid : 8
/// name : "Air Care"

class GetCategoryData {
  GetCategoryData({
      num? categoryid, 
      String? name,}){
    _categoryid = categoryid;
    _name = name;
}

  GetCategoryData.fromJson(dynamic json) {
    _categoryid = json['categoryid'];
    _name = json['name'];
  }
  num? _categoryid;
  String? _name;
GetCategoryData copyWith({  num? categoryid,
  String? name,
}) => GetCategoryData(  categoryid: categoryid ?? _categoryid,
  name: name ?? _name,
);
  num? get categoryid => _categoryid;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryid'] = _categoryid;
    map['name'] = _name;
    return map;
  }

}