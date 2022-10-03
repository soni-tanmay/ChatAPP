part of 'chat_repo.dart';

class ChatModel {
  ChatModel({
    required this.user,
    required this.payload,
  });

  User user;
  Payload payload;

  ChatModel copyWith({
    User? user,
    Payload? payload,
  }) =>
      ChatModel(
        user: user ?? this.user,
        payload: payload ?? this.payload,
      );

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        user: User.fromJson(json["user"]),
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "payload": payload.toJson(),
      };
}

class Payload {
  Payload({
    required this.dateTime,
    required this.message,
    required this.senderId,
    required this.channelId,
  });

  String dateTime;
  String message;
  String senderId;
  String channelId;

  Payload copyWith({
    String? dateTime,
    String? message,
    String? senderId,
    String? channelId,
  }) =>
      Payload(
        dateTime: dateTime ?? this.dateTime,
        message: message ?? this.message,
        senderId: senderId ?? this.senderId,
        channelId: channelId ?? this.channelId,
      );

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        dateTime: json["dateTime"],
        message: json["message"],
        senderId: json["senderId"],
        channelId: json["channelId"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "message": message,
        "senderId": senderId,
        "channelId": channelId,
      };
}

