class UserModel {
  UserModel({required this.email, required this.messages});

  final String email;
  final List<MessagesModel> messages;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      messages: (json['messages'] as List)
          .map((messageJson) => MessagesModel.fromJson(messageJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}

class MessagesModel {
  MessagesModel({required this.message, required this.messageTime});

  final String message;
  final String messageTime;

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      message: json['message'] as String,
      messageTime: json['messageTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'messageTime': messageTime,
    };
  }
}