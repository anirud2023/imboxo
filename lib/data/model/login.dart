class LoginModel {
  int? status;
  int? success;
  String? token;
  Data? data;
  String? message;

  LoginModel({this.status, this.success, this.token, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? userId;
  String? name;
  bool? paymentStatus;
  bool? paymentExpired;

  Data({this.userId, this.name, this.paymentStatus, this.paymentExpired});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    paymentStatus = json['payment_status'];
    paymentExpired = json['payment_expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['payment_status'] = this.paymentStatus;
    data['payment_expired'] = this.paymentExpired;
    return data;
  }
}
