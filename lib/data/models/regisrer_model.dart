class RegisterModel {
  late final int status;
  late final String message;

  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}