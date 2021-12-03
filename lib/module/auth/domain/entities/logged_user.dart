class LoggedUserModel {
  LoggedUserModel({this.sucess = false, this.token, this.message});

  bool sucess;
  String? token;
  String? message;

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedUserModel(
        sucess: json["sucess"] == null ? null : json["sucess"],
        token: json["token"] == null ? null : json["token"],
        message: json["message"] == null ? null : json["message"],
      );
}
