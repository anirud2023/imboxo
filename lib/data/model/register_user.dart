class RegisterModel {
  int? status;
  int? success;
  String? message;
  List<Map<String, String>>? errors;

  RegisterModel({this.status, this.success, this.message, this.errors});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];

    if (json['errors'] != null && json['errors'] is List) {
      errors = (json['errors'] as List)
          .map((e) => Map<String, String>.from(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors;
    }
    return data;
  }
}
