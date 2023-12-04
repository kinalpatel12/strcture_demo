class LoginModel {
  bool? success;
  LoginData? data;
  String? message;

  LoginModel({this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class LoginData {
  String? token;
  UserData? userData;

  LoginData({this.token, this.userData});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userData = json['userData'] != null
        ? UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? email;
  String? username;
  int? roleId;
  int? status;
  String? phone;
  String? gender;
  String? age;
  String? countryCode;
  String? isoCode;
  String? emailVerifiedAt;
  String? deviceToken;
  String? verificationCode;
  String? deletedAt;

  UserData(
      {this.id,
        this.email,
        this.username,
        this.roleId,
        this.status,
        this.phone,
        this.gender,
        this.age,
        this.countryCode,
        this.isoCode,
        this.emailVerifiedAt,
        this.deviceToken,
        this.verificationCode,
        this.deletedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    roleId = json['role_id'];
    status = json['status'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    countryCode = json['country_code'];
    isoCode = json['iso_code'];
    emailVerifiedAt = json['email_verified_at'];
    deviceToken = json['device_token'];
    verificationCode = json['verification_code'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['role_id'] = roleId;
    data['status'] = status;
    data['phone'] = phone;
    data['gender'] = gender;
    data['age'] = age;
    data['country_code'] = countryCode;
    data['iso_code'] = isoCode;
    data['email_verified_at'] = emailVerifiedAt;
    data['device_token'] = deviceToken;
    data['verification_code'] = verificationCode;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
