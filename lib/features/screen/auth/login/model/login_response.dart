// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);



class LoginResponse {
	bool? status;
	String? message;
	String? token;
	int? id;

	LoginResponse({
		this.status,
		this.message,
		this.token,
		this.id,
	});

	LoginResponse copyWith({
		bool? status,
		String? message,
		String? token,
		int? id,
	}) =>
			LoginResponse(
				status: status ?? this.status,
				message: message ?? this.message,
				token: token ?? this.token,
				id: id ?? this.id,
			);

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
		status: json["status"],
		message: json["message"],
		token: json["token"],
		id: json["id"],
	);

	Map<String, dynamic> toJson() => {
		"status": status,
		"message": message,
		"token": token,
		"id": id,
	};
}
