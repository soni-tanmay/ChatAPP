import 'package:dio/dio.dart';

import '../../utilities/export.dart';
import '../authentication/authentication_repo.dart';

part 'chat_model.dart';

class ChatRepo {
  ChatRepo._();
  static final ChatRepo instance = ChatRepo._();
  final Dio dio = ApiClient.instance.getClient;

  Future<List<ChatModel>> fetchChat(String channelId) async {
    final Response response = await dio.get('/message?channelId=$channelId');
    print(response.data.runtimeType);
    final chats = List<ChatModel>.from(response.data.map(
      (e) => ChatModel(
        user: User(
            id: e['id'],
            name: e['userName'],
            profilePic: e['image'],
            userName: e['userName'],
            email: ''),
        payload: Payload(
            dateTime: e['createdAt'],
            message: e['message'],
            senderId: '',
            channelId: e['channelId']),
      ),
    ));
    return chats;
  }
}
