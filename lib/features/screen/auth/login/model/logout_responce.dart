class LogoutResponse {
  bool? success;
  String? message;

  LogoutResponse({
    this.success,
    this.message,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => LogoutResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
